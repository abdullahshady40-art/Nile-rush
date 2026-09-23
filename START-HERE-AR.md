# تشغيل NILE RUSH بسهولة

## أسهل طريقة على الكمبيوتر
1. ثبّت Node.js إصدار 18 أو أحدث.
2. فك الضغط عن المشروع.
3. افتح مجلد `nile-rush`.
4. شغّل `RUN-WINDOWS.bat` أو من Terminal:
   `npm start`
5. افتح في المتصفح:
   `http://localhost:8080`

## لو المنفذ 8080 مستخدم
استخدم:
`node tools/serve.js 8081`
ثم افتح:
`http://localhost:8081`

## على أندرويد
يمكن استخدام Termux:
1. ثبّت Node.js داخل Termux.
2. ادخل إلى مجلد المشروع.
3. شغّل:
   `node tools/serve.js 8080`
4. افتح Chrome على:
   `http://127.0.0.1:8080`

## مهم جدًا
لا تفتح `index.html` مباشرة من مدير الملفات (`file://`).
اللعبة تستخدم JavaScript ES Modules وWebGL2، لذلك لازم تعمل من `http://` أو `https://`.

## هل ملفات assets الفارغة مشكلة؟
لا. في النسخة الحالية مجلدات `assets/models` و`assets/images` و`assets/audio` اختيارية، واللعبة تستخدم رسومات إجرائية وصوتًا مولدًا من Web Audio API عند عدم وجود ملفات خارجية. لذلك تركها فارغة لا يمنع تشغيل اللعبة.

## الاختبار
تم فحص المشروع:
- 45 ملف JavaScript بدون أخطاء Syntax.
- 84 استيرادًا نسبيًا تم حلّها بنجاح.
- ملفات HTML وManifest وService Worker وإعدادات الاستضافة موجودة.
