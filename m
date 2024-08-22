Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5844CC5472E
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:43:58 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.4151.1724291030773666011
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 18:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ldKAk7AX;
 spf=pass (domain: linaro.org, ip: 209.85.128.178, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-691c85525ebso3289157b3.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724291030; x=1724895830; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6cnGubIUPfqUNMZsTLbuxSnui3vnRbhrJbBfO5KvAM=;
        b=ldKAk7AX/PKxhm3jqObBZel5WcWw5h8xLr/vYiS5KGUWatl6nqI6u3QhHfK1XcbiD7
         NnVYZKZwFvdNOIzO//aoNau/OIbHCdf9MQsDdcHyCZJI8CIGvq3VpU5GYMp8ETYAQ7eZ
         CNSrlgSn22apYc+c1qPj857IMWPaWOx9cy85ljAs6zjU9wbktv/a3EacYwjmadUFggwo
         u5klUycYZMOcKA3ir6FznPaiNvw9gorS0m3GImH5Cb+G9V3dKFdQYkA9/uP/Fvzs3ZnY
         tphBwTs/9GY/+0l5GZFwiQumejJghbAeD7tT4ubVcdaz1DraHkae1b1jJqGbkfRoW85j
         E5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724291030; x=1724895830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6cnGubIUPfqUNMZsTLbuxSnui3vnRbhrJbBfO5KvAM=;
        b=XFiEdppac0TGTLSuk6VWtrniV7xBVF90I192it1ODjkakyXPhOljfqaYKM2aTyAl2H
         XNawawGX4oeeq9+yYVw7Qd4TkpD3Tw/PNPvzTh1lCduL9iBeFPTFSY9Fc1UxFtdCc03D
         4jQMvMnI1tH/pFVWtRp20ft55LWQSCQZJRIzuzbo5JSLugGXlJ1ntz6+TPU4Mpu1tiCW
         zEJDxfjNg1l/9W244at/cmwqzcboXsjnhn63Pbw8SB7C0eB+CDOUJJACCXv4+ZIPyoTk
         z+CSZ4Q8yaylYPKwe9o8ZPV8k0jz9Zuax7Sea2zXku7U+sug2RZEHn2VDJPYxxG1vf1l
         Vo5g==
X-Gm-Message-State: AOJu0Yxcybif4XrWlFAHi2CCRrkSupSuFh0mT6V7WiL2D4lfj+yYY2mX
	YmKJejGe9uYIes0IFhW+R+ZgP4oAfhlodUwgtYY9B9FwRa84It354cvVbxcfxE79R+gpIJuEFtw
	C
X-Google-Smtp-Source: AGHT+IHq0gljN/KYAqIMseWn1wb3Qhr/V75BJ1ARanFTKY4yE9oL2G2YC56LFQWeGQBnVYDId/r5vg==
X-Received: by 2002:a05:690c:7087:b0:6be:97e7:ff76 with SMTP id 00721157ae682-6c09cd4e756mr51306977b3.11.1724291029818;
        Wed, 21 Aug 2024 18:43:49 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e6eae07sm707757b3.145.2024.08.21.18.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 18:43:49 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v3 07/13] meta-arm: Introduce gen-uefi-sb-keys.bb recipe
Date: Wed, 21 Aug 2024 19:43:29 -0600
Message-ID: <20240822014335.3394568-8-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822014335.3394568-1-javier.tia@linaro.org>
References: <20240822014335.3394568-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Aug 2024 01:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5997

Generate a new set of keys on build time. It avoids to use same keys
which could generate a security issue.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb | 26 +++++++++
 meta-arm/uefi-sb-keys/.gitignore              |  4 ++
 meta-arm/uefi-sb-keys/gen_uefi_keys.sh        | 56 +++++++++----------
 3 files changed, 57 insertions(+), 29 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb
 create mode 100644 meta-arm/uefi-sb-keys/.gitignore

diff --git a/meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb b/meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb
new file mode 100644
index 00000000..a4ae6d87
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: MIT
+
+SUMMARY = "Generate UEFI keys for secure boot"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+DEPENDS += "bash-native"
+DEPENDS += "coreutils-native"
+DEPENDS += "efitools-native"
+DEPENDS += "openssl-native"
+
+SRC_URI = "file://${UEFI_SB_KEYS_DIR}/gen_uefi_keys.sh"
+
+UNPACKDIR = "${S}"
+
+do_fetch[noexec] = "1"
+do_patch[noexec] = "1"
+do_compile[noexec] = "1"
+do_configure[noexec] = "1"
+
+do_install() {
+    ${UEFI_SB_KEYS_DIR}/gen_uefi_keys.sh ${UEFI_SB_KEYS_DIR}
+}
+
+FILES:${PN} = "${UEFI_SB_KEYS_DIR}/*.key"
+FILES:${PN} += "${UEFI_SB_KEYS_DIR}/*.crt"
diff --git a/meta-arm/uefi-sb-keys/.gitignore b/meta-arm/uefi-sb-keys/.gitignore
new file mode 100644
index 00000000..f8669919
--- /dev/null
+++ b/meta-arm/uefi-sb-keys/.gitignore
@@ -0,0 +1,4 @@
+*.auth
+*.crt
+*.esl
+*.key
\ No newline at end of file
diff --git a/meta-arm/uefi-sb-keys/gen_uefi_keys.sh b/meta-arm/uefi-sb-keys/gen_uefi_keys.sh
index fc7f25c9..21e65c72 100755
--- a/meta-arm/uefi-sb-keys/gen_uefi_keys.sh
+++ b/meta-arm/uefi-sb-keys/gen_uefi_keys.sh
@@ -1,35 +1,33 @@
-#/bin/sh
+#!/bin/bash
+#
+# SPDX-License-Identifier: MIT
+#
 
 set -eux
 
-#Create PK
-openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=Linaro_LEDGE/ -keyout PK.key -out PK.crt -nodes -days 3650
-cert-to-efi-sig-list -g 11111111-2222-3333-4444-123456789abc PK.crt PK.esl
-sign-efi-sig-list -c PK.crt -k PK.key PK PK.esl PK.auth
+KEYS_PATH=${1:-./}
+SUBJECT="/CN=Linaro_LEDGE/"
+GUID="11111111-2222-3333-4444-123456789abc"
 
-#Create KEK
-openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=Linaro_LEDGE/ -keyout KEK.key -out KEK.crt -nodes -days 3650
-cert-to-efi-sig-list -g 11111111-2222-3333-4444-123456789abc KEK.crt KEK.esl
-sign-efi-sig-list -c PK.crt -k PK.key KEK KEK.esl KEK.auth
+openssl req -x509 -sha256 -newkey rsa:2048 -subj "${SUBJECT}" \
+    -keyout "${KEYS_PATH}"/PK.key -out "${KEYS_PATH}"/PK.crt \
+    -nodes -days 3650
+cert-to-efi-sig-list -g ${GUID} \
+    "${KEYS_PATH}"/PK.crt "${KEYS_PATH}"/PK.esl
+sign-efi-sig-list -c "${KEYS_PATH}"/PK.crt -k "${KEYS_PATH}"/PK.key \
+    "${KEYS_PATH}"/PK "${KEYS_PATH}"/PK.esl "${KEYS_PATH}"/PK.auth
 
-#Create DB
-openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=Linaro_LEDGE/ -keyout db.key -out db.crt -nodes -days 3650
-cert-to-efi-sig-list -g 11111111-2222-3333-4444-123456789abc db.crt db.esl
-sign-efi-sig-list -c KEK.crt -k KEK.key db db.esl db.auth
-
-#Create DBX
-openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=Linaro_LEDGE/ -keyout dbx.key -out dbx.crt -nodes -days 3650
-cert-to-efi-sig-list -g 11111111-2222-3333-4444-123456789abc dbx.crt dbx.esl
-sign-efi-sig-list -c KEK.crt -k KEK.key dbx dbx.esl dbx.auth
-
-#Sign image
-#sbsign --key db.key --cert db.crt Image
-
-#Digest image
-#hash-to-efi-sig-list Image db_Image.hash
-#sign-efi-sig-list -c KEK.crt -k KEK.key db db_Image.hash db_Image.auth
-
-#Empty cert for testing
-touch noPK.esl
-sign-efi-sig-list -c PK.crt -k PK.key PK noPK.esl noPK.auth
+for key in KEK db dbx; do
+    openssl req -x509 -sha256 -newkey rsa:2048 -subj "${SUBJECT}" \
+        -keyout "${KEYS_PATH}"/${key}.key -out "${KEYS_PATH}"/${key}.crt \
+        -nodes -days 3650
+    cert-to-efi-sig-list -g ${GUID} \
+        "${KEYS_PATH}"/${key}.crt "${KEYS_PATH}"/${key}.esl
+    sign-efi-sig-list -c "${KEYS_PATH}"/PK.crt -k "${KEYS_PATH}"/PK.key \
+        "${KEYS_PATH}"/${key} "${KEYS_PATH}"/${key}.esl "${KEYS_PATH}"/${key}.auth
+done
 
+# Empty cert for testing
+touch "${KEYS_PATH}"/noPK.esl
+sign-efi-sig-list -c "${KEYS_PATH}"/PK.crt -k "${KEYS_PATH}"/PK.key \
+    "${KEYS_PATH}"/PK "${KEYS_PATH}"/noPK.esl "${KEYS_PATH}"/noPK.auth
-- 
2.46.0


