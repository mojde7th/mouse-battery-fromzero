# کارگاه باتری ماوس بی‌سیم — از صفر

مسیر:

```
D:\workshops\mouse-battery-fromzero
```

## چیست

آموزش گام‌به‌گام فارسی برای فهمیدن چرا باتری ماوس بی‌سیم زود تمام می‌شود، معماری برق، تفاوت حالت‌های ویندوز، شیمی باتری، تشخیص امن روی ویندوز، و متن آماده برای حرف با رئیس.

سبک همان الگوی Confluence Master 3 است: سایدبار، تیک خواندم، گام‌های ریز، اصطلاح فنی ترجمه نمی‌شود.

## باز کردن

فایل را در مرورگر باز کن:

```
D:\workshops\mouse-battery-fromzero\index.html
```

یا از پاورشل:

```
start D:\workshops\mouse-battery-fromzero\index.html
```

## فایل‌ها

| فایل | نقش |
|------|-----|
| `index.html` | کل کارگاه |
| `app.css` | ظاهر |
| `app.js` | ناوبری و تیک خواندم |
| `scripts/check-wake.ps1` | گزارش امن بیدارباش |
| `README.md` | همین راهنما |
| `_DONE.txt` | فهرست تحویل |
| `notes.txt` | خودت در تکلیف می‌سازی |

## اسکریپت تشخیص

فقط خواندن است؛ چیزی را عوض نمی‌کند:

```
cd D:\workshops\mouse-battery-fromzero\scripts
powershell -NoProfile -ExecutionPolicy Bypass -File .\check-wake.ps1
```

دستورهای معادل دستی:

```
powercfg -devicequery wake_armed
powercfg -lastwake
```

## اصطلاح‌هایی که ترجمه نمی‌شوند

```
PowerShell
Device Manager
USB
HID
hibernate
sleep
shutdown
powercfg
Fast Startup
alkaline
lithium
NiMH
polling rate
dongle
Bluetooth
```

## ترتیب پیشنهادی برای رئیس

1. باتری بهتر یا آزمایش lithium
2. سویچ خاموش وقتی بیکار است
3. جای dongle و سطح میز
4. چک wake در Windows
5. ماوس نو اگر سخت‌افزار پیر است

پوش نکن مگر جداگانه خواسته شود.
