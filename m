Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.654.1580319700481472000
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 09:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iKyqMiaz;
 spf=pass (domain: linaro.org, ip: 209.85.128.67, mailfrom: peter.griffin@linaro.org)
Received: by mail-wm1-f67.google.com with SMTP id s10so687113wmh.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jan 2020 09:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9kAl4Qhd8SlXZrHqf1+wkiHbXFZvF9Uu6EBBmPsZjyU=;
        b=iKyqMiazKxY8LgeeQZvoDjPHLpVOCvkwCCauD76FcOMwDO4Ckf3jxlFnuUWNT+sCU1
         RqEdyzHQKIA6r3V9NWtTvMteXKqnXltRY+/6sxEdAN4aqARoaralIgdS1JUcbYveYV7k
         VA3JZu3U6hFNxcMly3UQyAqMznYJuna5SZaR0mG8tSr4RTeTGLW8W1TW0gwEI9xpCwve
         5hANNtz5kluXms9TPu6FN9gEuxZschWqUbOlxswdTkY7QL31weKtam17jfoikqu8Kcaf
         FopxNXdOWbofyen4mlkEZbnnxkboZdQoSVNHPb5GLgKzDc5+eyNotQoIO8oS2xqQC8un
         x8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9kAl4Qhd8SlXZrHqf1+wkiHbXFZvF9Uu6EBBmPsZjyU=;
        b=ES6QH1H4CpapN/t81rR2aM6nR3pBIa/DLdjYspgcQfQk56GMqMRk3/Lfj5vKJ98S2u
         J2Odgs8tBdToHq0I6hz8UKm+iEp9sa76lnb67zfeQyG8uWx6l+yPsQVq6P2sjRqb9nC/
         6Y9YQgXkvK54TwbQ+3oXcWs+2EhXXcdY8nRDuuFSS3v+1Gzv16rpxMy1nGvIEGW8fKSk
         ec0YQUFC/xWj4xQObovZJHGeHlgHSt+i6g0zRCZ0cSY9k4FTu+CV6KFqunqIKmWno2n2
         p+nCeidkRLbv/3h8UskFRzjTTOEedrVH93qd9tqsJJTDEmA9KqtCnnyDXsOguf3qer7G
         tqfw==
X-Gm-Message-State: APjAAAU8mMHxkBq3pSUZ8IWU8uIlvbEjOGXa0w/PzMBnmKaobEyAv57S
	EFCQp/wlvAQVYO5KYFtYn0xeXgmzol4=
X-Google-Smtp-Source: APXvYqwpvLaj2ug+FeQxUyeolHYYSfJvLARfo/MgWGfbQLS1qRSSKXC8vKjIzXkTiG5723dOYzO38g==
X-Received: by 2002:a1c:3906:: with SMTP id g6mr366703wma.49.1580319698643;
        Wed, 29 Jan 2020 09:41:38 -0800 (PST)
Return-Path: <peter.griffin@linaro.org>
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust4998.18-1.cable.virginm.net. [86.31.179.135])
        by smtp.gmail.com with ESMTPSA id y185sm3231525wmg.2.2020.01.29.09.41.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 29 Jan 2020 09:41:38 -0800 (PST)
From: "Peter Griffin" <peter.griffin@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	denis@denix.org,
	jon.mason@arm.com,
	raj.khem@gmail.com,
	nicolas.dechesne@linaro.org
Cc: joakim.bech@linaro.org,
	moorthy.baskaravenkatraman-sambamoorthy@linaro.org,
	alexandre.jutras@linaro.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 1/5] optee-client.bb: add optee client recipe and patches
Date: Wed, 29 Jan 2020 17:38:41 +0000
Message-Id: <1580319525-32054-2-git-send-email-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>
References: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>

This has moved from meta-linaro to meta-arm as this
is the new place for general recipes for Arm arch
and has a mailing list for external contributors.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 meta-arm/recipes-security/optee/optee-client.bb    | 35 ++++++++++++++++++++++
 .../optee/optee-client/tee-supplicant.service      | 10 +++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-client.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-client/tee-supplicant.service

diff --git a/meta-arm/recipes-security/optee/optee-client.bb b/meta-arm/recipes-security/optee/optee-client.bb
new file mode 100644
index 0000000..519683a
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client.bb
@@ -0,0 +1,35 @@
+SUMMARY = "OPTEE Client"
+HOMEPAGE = "https://github.com/OP-TEE/optee_client"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
+
+PV = "3.7.0+git${SRCPV}"
+
+inherit python3native systemd
+
+SRC_URI = "git://github.com/OP-TEE/optee_client.git \
+           file://tee-supplicant.service"
+S = "${WORKDIR}/git"
+
+SRCREV = "bc0ec8ce1e4dc5ae23f4737ef659338b7cd408fe"
+
+SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
+
+do_install() {
+    oe_runmake install
+
+    install -D -p -m0755 ${S}/out/export/usr/sbin/tee-supplicant ${D}${sbindir}/tee-supplicant
+
+    install -D -p -m0644 ${S}/out/export/usr/lib/libteec.so.1.0 ${D}${libdir}/libteec.so.1.0
+    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
+    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
+
+    cp -a ${S}/out/export/usr/include ${D}/usr/
+
+    sed -i -e s:/etc:${sysconfdir}:g \
+           -e s:/usr/bin:${bindir}:g \
+              ${WORKDIR}/tee-supplicant.service
+
+    install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
+}
diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
new file mode 100644
index 0000000..ffb54d3
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=TEE Supplicant
+
+[Service]
+User=root
+EnvironmentFile=-/etc/default/tee-supplicant
+ExecStart=/usr/sbin/tee-supplicant $OPTARGS
+
+[Install]
+WantedBy=basic.target
-- 
2.7.4

