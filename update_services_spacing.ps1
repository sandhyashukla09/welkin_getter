$files = @(
    "service-cloud-native-apps.html",
    "service-digital-marketing.html",
    "service-lms-ecosystems.html",
    "service-web-platforms.html"
)

foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw
        $originalContent = $content

        $content = $content -replace '\.features \{ padding: 6rem 0; \}', '.features { padding: 3rem 0; }'
        $content = $content -replace '\.feature-grid \{ display: grid; grid-template-columns: repeat\(auto-fit, minmax\(300px, 1fr\)\); gap: 2rem; \}', '.feature-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; }'
        $content = $content -replace '\.feature-card \{ background: white; padding: 2\.5rem; border-radius: var\(--r-xl\); border: 1px solid rgba\(0,0,0,0\.05\); \}', '.feature-card { background: white; padding: 1.5rem; border-radius: var(--r-xl); border: 1px solid rgba(0,0,0,0.05); }'
        $content = $content -replace '\.cta-section \{ padding: 6rem 0; background: var\(--bg-dark\); color: white; text-align: center; \}', '.cta-section { padding: 3rem 0; background: var(--bg-dark); color: white; text-align: center; }'
        $content = $content -replace 'footer \{ padding: 4rem 0; background: #050912; color: #64748B; text-align: center; border-top: 1px solid rgba\(255,255,255,0\.05\); \}', 'footer { padding: 2rem 0; background: #050912; color: #64748B; text-align: center; border-top: 1px solid rgba(255,255,255,0.05); }'

        if ($content -ne $originalContent) {
            Set-Content -Path $file -Value $content -Encoding UTF8
            Write-Host "Updated $file"
        }
    }
}
Write-Host "Service files processed."
