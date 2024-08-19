Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F40C5321D
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 19:04:44 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.1080.1724094283184251129
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 12:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bcAoTUiD;
 spf=pass (domain: linaro.org, ip: 209.85.219.50, mailfrom: javier.tia@linaro.org)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6bf84c3d043so15825526d6.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 12:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724094282; x=1724699082; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6cnGubIUPfqUNMZsTLbuxSnui3vnRbhrJbBfO5KvAM=;
        b=bcAoTUiDPs9gVw9fdHiWR0mrrs4dVkOnO4aPMx3bT1fAX59YzmkzX3+vuUF1gaaStN
         JOkvtwvUOnKtKUnIL4ruXkffXxXsOX/GKCMSgZJ1Osq2qHaApfjq3+9egF2jgAW+PbuY
         WOfIe9l9uKP9BtZTNWCaVqe7Lnbj2QAEw0DPx3WZjSIAM26Kmh2b4I4Q7ljnoYpCP5v6
         N/A8crU4N/jbWl/kCHXvn6qxg99nx8cMeA2bnDC+dcdrvpDBZnL5aO2rZj2gYAbRRwLc
         E477wdpdvBN9xk+HhxpwC1k7Z1uYtLu3H+AZI2Qa4vPWxcUIUFp6L2yV3B9lnqmZ8t2l
         Oq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724094282; x=1724699082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6cnGubIUPfqUNMZsTLbuxSnui3vnRbhrJbBfO5KvAM=;
        b=HBAAnS5mfymgyh2w0UZt9PefB8TCNGGnvKJyWjwFTMNRAQ0BAidHzWiNtsFNhWsxHE
         mZ9wfnw/+6a1SA+uP3MUP5gIZn+SO9oP+Kt4zxU5IDa1agNqlglKkXps8zuptgKt6FZQ
         ryPDRodnTXmMKFjVBJcLNYECTPPIkCpj8oNYCBhCtczBQNWOrWC3vOoqWkKQMhV2xZzg
         p2CGZjJ8TNtarW5mxmZcPXC9dLQF37xY7fPCEOwMUX6HDYwP2ILjO2YZCY+p3XWGYEvZ
         l5HC7P/sT1v00x5xKoryF9f7yyX+W1nIsuA8ZD7i6Te2RWXaAGKN5KDxBWG/QTmjN2vk
         VnMw==
X-Gm-Message-State: AOJu0Ywkcn5x/SRlk+Ayts56wde/99T1ezI/ZlSz4Gosf8XhFM9zybt7
	J+KKg6/AUi6cSJBIv1EHrXE+6stXhe7MgZV9YFylesQt7+9gS3S2GBqh0OrP1R7dRy5utQmr3YS
	0
X-Google-Smtp-Source: AGHT+IGLi/fK7gboV6V10W2/Ipz6aR1Y+RPypFMSJPncB7RhI/8GltEYEi2Xi7HRZA6/2wYwrDkpgw==
X-Received: by 2002:a05:6214:311e:b0:6b5:eba0:d0ab with SMTP id 6a1803df08f44-6bf7cd999d4mr115243006d6.15.1724094281898;
        Mon, 19 Aug 2024 12:04:41 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([177.93.4.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe06feasm45371756d6.40.2024.08.19.12.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:04:41 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v2 07/14] meta-arm: Introduce gen-uefi-sb-keys.bb recipe
Date: Mon, 19 Aug 2024 13:04:22 -0600
Message-ID: <20240819190429.2897888-8-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819190429.2897888-1-javier.tia@linaro.org>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 19:04:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5973

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


