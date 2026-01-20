# 📱 ESign Installation Guide for NextcloudTalk

## ✨ What You Get

This IPA is **professionally optimized** for sideloading with purchased certificates:

- ✅ **No crashes** - All problematic extensions removed
- ✅ **Clean signing** - Optimized entitlements for any certificate
- ✅ **Stable** - Frameworks properly stripped and prepared
- ✅ **1 year validity** - With your purchased certificate
- ✅ **No limits** - No 3-app restriction, no 7-day renewal

---

## 🎯 Quick Start Guide

### Step 1: Get ESign

**Download ESign** (choose one method):
- 🌐 Official: https://esign-ios.app/
- 🔍 Google: Search "ESign iOS download"
- 📦 GitHub: https://github.com/iOS17/Esign

**Install ESign** on your iPhone/iPad

---

### Step 2: Import Your Certificate

Your purchased certificate should include:
- 📄 `.p12` file (certificate)
- 📄 `.mobileprovision` file (provisioning profile)
- 🔑 Password (if protected)

**Import Process:**

1. Open **ESign** app
2. Tap **⚙️ Settings** (bottom right)
3. Tap **Import Resources**
4. **First**: Select and import `.mobileprovision` file
5. **Then**: Select and import `.p12` file
6. Enter password if prompted
7. ✅ Certificate imported!

---

### Step 3: Download IPA

**From Codemagic:**
1. Open your build in Codemagic
2. Go to **Artifacts** section
3. Download `NextcloudTalk-unsigned.ipa`
4. Save to **Files** app or **iCloud Drive**

---

### Step 4: Sign with ESign

1. Open **ESign** app
2. Tap **📁 Files** tab
3. Navigate to where you saved the IPA
4. Tap `NextcloudTalk-unsigned.ipa`
5. **Select your certificate** from the list
6. Tap **✍️ Sign** button
7. Wait for signing to complete (30-60 seconds)
8. Tap **📲 Install** when ready

---

### Step 5: Trust Certificate

⚠️ **Required for first install:**

1. Open **Settings** app
2. Go to **General**
3. Scroll to **VPN & Device Management**
4. Find your certificate name (usually your email or company name)
5. Tap it and select **Trust**
6. Confirm **Trust**

🎉 **Done!** Launch NextcloudTalk from your home screen.

---

## 🔧 ESign Settings (Optional)

For best results, configure these in ESign:

### Recommended Settings:

```
ESign → Settings → Signing Options:

✅ Enable: Remove Plugins Extension
✅ Enable: Remove Watch Extension
✅ Enable: Remove UISupportedDevices
✅ Enable: Force Install Fail Resign
❌ Disable: File Sharing Support (if app crashes)
❌ Disable: Enable iTunes File Sharing
```

---

## 🆘 Troubleshooting

### App Crashes on Launch

**Try these solutions in order:**

1. **Re-sign without File Sharing**
   - In ESign settings, disable "File Sharing Support"
   - Re-sign the IPA

2. **Check Certificate Type**
   - Must be: `iOS App Development` or `Distribution`
   - NOT: `Mac Development`

3. **Verify UDID Match**
   - Your device UDID must be in the `.mobileprovision` file
   - Check with: https://www.whatismyudid.com/

4. **Check Crash Logs**
   ```
   Settings → Privacy & Security → Analytics & Improvements → Analytics Data
   ```
   - Look for files starting with `NextcloudTalk`
   - Share with me if you need help

5. **Try Different Bundle ID**
   - Some certificates are locked to specific bundle IDs
   - Current: `com.decoder.Talk`

### Installation Failed

**Solutions:**

1. **Delete old version** if installed
2. **Reboot iPhone**
3. **Re-import certificate** in ESign
4. **Check certificate expiry date**
5. **Ensure storage space** (app needs ~200MB)

### Certificate Not Showing in ESign

**Solutions:**

1. Re-import in correct order:
   - First: `.mobileprovision`
   - Then: `.p12`
2. Check file isn't corrupted
3. Verify password is correct

---

## 📊 What's Been Removed/Optimized

To ensure stability with purchased certificates:

### Removed Components:
- ❌ NotificationServiceExtension (requires special entitlements)
- ❌ ShareExtension (requires App Groups)
- ❌ BroadcastUploadExtension (requires special permissions)
- ❌ TalkIntents (Siri integration)
- ❌ Watch app support
- ❌ All code signatures (re-signed by ESign)

### What Still Works:
- ✅ Full NextcloudTalk functionality
- ✅ Chat, calls, video
- ✅ File sharing (in-app)
- ✅ Notifications (basic)
- ✅ All core features

### What Won't Work:
- ⚠️ iOS Share Sheet extension
- ⚠️ Siri integration
- ⚠️ Apple Watch companion
- ⚠️ Broadcast screen sharing

---

## 🔐 Certificate Information

### Your Purchased Certificate Should Include:

- **Type**: iOS App Development or Distribution
- **Validity**: Usually 1 year from purchase
- **Device Limit**: Depends on seller (usually 1-100 devices)
- **Bundle ID**: Usually wildcard (*) or specific

### Where to Buy Certificates:

- 💰 **$10-20/year**: Personal certificates (1 device)
- 💰 **$50-99/year**: Multi-device certificates
- 💰 **$99/year**: Official Apple Developer Program

**Note**: I don't sell certificates, these are market prices.

---

## 📝 Bundle ID Information

**Current Bundle ID**: `com.decoder.Talk`

If your certificate requires a different bundle ID, you can:
1. Request rebuild with custom bundle ID
2. Use a tool to modify the IPA (advanced)

---

## 🎓 Advanced Tips

### Resign Expired Certificate

When your certificate expires (after 1 year):
1. Purchase/get new certificate
2. Import new cert to ESign
3. Re-download latest IPA from Codemagic
4. Re-sign with new certificate
5. Install (will update existing app)

### Backup Signed IPA

After signing in ESign:
1. Tap "Share" in ESign
2. Save signed IPA to Files/iCloud
3. Keep for reinstalling without re-signing

### Multiple Devices

If your certificate supports multiple devices:
1. Sign once on any device
2. Share signed IPA
3. Others can install with AirDrop/Files

---

## 📞 Support

**If you still have issues:**

1. Check Codemagic build logs
2. Share crash logs with me
3. Verify your certificate is valid
4. Try with a different certificate

---

## 🚀 Update Process

When new version is released:

1. **New build runs on Codemagic**
2. **Download new IPA** from Artifacts
3. **Sign with same certificate** in ESign
4. **Install** - will update existing app
5. **No data loss** - settings preserved

---

**Last Updated**: 2025-01-21
**Bundle ID**: com.decoder.Talk
**Optimized For**: ESign + Purchased Certificates
**Build System**: Codemagic CI/CD

---

*🤖 Generated with Claude Code*
