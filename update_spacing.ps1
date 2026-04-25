$files = Get-ChildItem -Filter "*.html" | Where-Object { $_.Name -notmatch '^(index\.html|services\.html|privacy\.html)$' }

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    $originalContent = $content

    # Design System variables
    $content = $content -replace '--space-sm:\s*1rem;', '--space-sm:    0.5rem;'
    $content = $content -replace '--space-md:\s*1.5rem;', '--space-md:    1rem;'
    $content = $content -replace '--space-lg:\s*2rem;', '--space-lg:    1.5rem;'
    $content = $content -replace '--space-xl:\s*3rem;', '--space-xl:    2rem;'
    $content = $content -replace '--space-2xl:\s*4rem;', '--space-2xl:   2.5rem;'

    # Layout classes
    $content = $content -replace '\.section \{ padding: 2\.5rem 0; scroll-margin-top: 60px; \}', '.section { padding: 1.5rem 0; scroll-margin-top: 60px; }'
    $content = $content -replace '\.grid \{ display: grid; gap: 2rem; \}', '.grid { display: grid; gap: 1.5rem; }'

    # Component classes
    $content = $content -replace '(?s)\.card \{\s*background: var\(--surface-solid\);\s*border: 1px solid var\(--border\);\s*border-top: 3px solid var\(--primary\);\s*border-radius: var\(--r-lg\);\s*padding: 2\.5rem;', '.card {`n    background: var(--surface-solid);`n    border: 1px solid var(--border);`n    border-top: 3px solid var(--primary);`n    border-radius: var(--r-lg);`n    padding: 1.5rem;'

    $content = $content -replace '(?s)\.trust-band \{\s*background: #FFFFFF;\s*padding: 1\.5rem 0;', '.trust-band {`n    background: #FFFFFF;`n    padding: 1rem 0;'

    $content = $content -replace '(?s)\.blog-content \{\s*padding: 1\.5rem;', '.blog-content {`n    padding: 1rem;'

    $content = $content -replace '(?s)\.service-card \{\s*padding: 2rem;', '.service-card {`n  padding: 1.5rem;'

    $content = $content -replace '(?s)\.number-item \{\s*text-align: center; padding: 2rem;', '.number-item {`n  text-align: center; padding: 1.5rem;'

    $content = $content -replace '(?s)\.process-step \{\s*background: var\(--surface\); border: 1px solid var\(--border\);\s*border-radius: var\(--r-xl\); padding: 2rem;', '.process-step {`n  background: var(--surface); border: 1px solid var(--border);`n  border-radius: var(--r-xl); padding: 1.5rem;'

    $content = $content -replace '(?s)padding: 1\.4rem; background: var\(--surface\); border: 1px solid var\(--border\);', 'padding: 1rem; background: var(--surface); border: 1px solid var(--border);'

    $content = $content -replace '(?s)\.why-panel \{\s*background: var\(--surface\); border: 1px solid var\(--border\);\s*border-radius: var\(--r-2xl\); padding: 2\.5rem;', '.why-panel {`n  background: var(--surface); border: 1px solid var(--border);`n  border-radius: var(--r-2xl); padding: 1.5rem;'

    $content = $content -replace '(?s)\.testimonial-card \{\s*background: var\(--surface\); border: 1px solid var\(--border\);\s*border-radius: var\(--r-xl\); padding: 2rem;', '.testimonial-card {`n  background: var(--surface); border: 1px solid var(--border);`n  border-radius: var(--r-xl); padding: 1.5rem;'

    $content = $content -replace '(?s)\.p-info \{ padding: 1\.5rem; \}', '.p-info { padding: 1rem; }'

    $content = $content -replace '(?s)\.price-card \{\s*background: var\(--surface\); border: 1px solid var\(--border\);\s*border-radius: var\(--r-2xl\); padding: 2\.5rem;', '.price-card {`n  background: var(--surface); border: 1px solid var(--border);`n  border-radius: var(--r-2xl); padding: 1.5rem;'

    $content = $content -replace '(?s)\.contact-grid \{ display: grid; grid-template-columns: 5fr 7fr; gap: 4rem; \}', '.contact-grid { display: grid; grid-template-columns: 5fr 7fr; gap: 2rem; }'

    $content = $content -replace '(?s)\.form-wrap \{\s*background: var\(--surface\); border: 1px solid var\(--border\);\s*border-radius: var\(--r-2xl\); padding: 2\.5rem;', '.form-wrap {`n  background: var(--surface); border: 1px solid var(--border);`n  border-radius: var(--r-2xl); padding: 1.5rem;'

    # Update Footer spacing from padding: 2rem 0 1rem; where it might be 4rem 0 2rem;
    $content = $content -replace '(?s)\.footer \{\s*background: var\(--bg-dark\);\s*color: white;\s*padding: 4rem 0 2rem;', '.footer {`n    background: var(--bg-dark);`n    color: white;`n    padding: 2rem 0 1rem;'
    
    $content = $content -replace '(?s)\.footer-main \{\s*display: grid;\s*grid-template-columns: repeat\(auto-fit, minmax\(200px, 1fr\)\);\s*gap: 2rem;\s*margin-bottom: 2rem;\s*border-bottom: 1px solid rgba\(255, 255, 255, 0\.1\);\s*padding-bottom: 2rem;', '.footer-main {`n    display: grid;`n    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));`n    gap: 1.5rem;`n    margin-bottom: 1.5rem;`n    border-bottom: 1px solid rgba(255, 255, 255, 0.1);`n    padding-bottom: 1.5rem;'


    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
Write-Host "All files processed."
