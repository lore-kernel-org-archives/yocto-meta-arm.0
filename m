Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EE1C54722
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 19:04:44 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.1078.1724094280447915289
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 12:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pfcfI9Hn;
 spf=pass (domain: linaro.org, ip: 209.85.210.45, mailfrom: javier.tia@linaro.org)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-70c9cda7f1cso2092293a34.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 12:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724094279; x=1724699079; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKeLT5wECjxCPh0q9TVfT28Dr9BXXolYW1ml7VAYpJM=;
        b=pfcfI9HnT0NrVtu8N199qBpL80Om+PNCzYgCqGg+n12Ddzs9KcGdFE7LqAWioYBpf6
         9SVinnPSfvDU/uC9Zz/x3ODZTlcL5vsy+64008J9SrECai4jbItHOQG1TcQRDghQJkgx
         8YLNDzitriENWZpY4NWvJMoYiJms3HVjcQ7QILVg3641uu6wUensqn6VxlXQes+J3k/b
         SVOVxVmcuK/wXLYiNXY9gzqMV5gKcU2i2Pbrmx/xNsedD3X300WzQT+HVTKzY8Nxs99f
         whZMOLj/B+yxHEktip0wag/Zkj6KelaL4icXn6hTVxdJeiC4bNQY1WX4EemV+xTr+1XZ
         Qssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724094279; x=1724699079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKeLT5wECjxCPh0q9TVfT28Dr9BXXolYW1ml7VAYpJM=;
        b=P5d5FxNCjxjMW0TNkg+4xWNCpWHPTwdwHUDuk0KaeczCF/8Sa/2DcvIRmDWy9ZI+iU
         uGXtrVa2yFHjU9VTXtKO0ztGJWkIaCHSaob2TM5kZM/8QLFnoVaaM/+cYAk228zoXLpm
         BfdBPqJ8o7dXKQGhDNvMfBvZE3cG2unKGsOhytDmLOsdm+8n36I7uWzEgcXrJNxhyPRY
         TxO9lALZe7/WlY6c3DQjA710Dmiog+cErDWRlEPZbahBkkusQcb9Eeuz9lXb0OTR0px3
         2TsqDXZ+WFxV2v4EN/EDSAO3hlJVhtPgRfHh2ZR6umUJYKzlwOTD45sD2gqZndmWfoDb
         JM1Q==
X-Gm-Message-State: AOJu0YyIn1YnDQieR7rs7WYyoyVjnlUkk5JKtJq8SnirUuGMGw2qoCim
	d1SrHO0IA/P/sXQTGThxAgybqV3y+fpuC7UyiLxqPa/lDy4UhqnHShL9n4gl3uXYlZOSM5v6Yx7
	j
X-Google-Smtp-Source: AGHT+IGl9zjip+zKJEqQr9kUBExE0TehQSKdjVO0Ft9fd1E1eRujsoCdHtu3uDledLpdl8OaXdWLMQ==
X-Received: by 2002:a05:6830:6c88:b0:70d:ee3a:ea6e with SMTP id 46e09a7af769-70dee3aee19mr249116a34.28.1724094279473;
        Mon, 19 Aug 2024 12:04:39 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([177.93.4.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe06feasm45371756d6.40.2024.08.19.12.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:04:39 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v2 05/14] sbsign.bbclass: Add class to sign binaries
Date: Mon, 19 Aug 2024 13:04:20 -0600
Message-ID: <20240819190429.2897888-6-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819190429.2897888-1-javier.tia@linaro.org>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 19:04:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5971

A lot of recipes are using these same steps to sign binaries
for UEFI secure boot.

Authored-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 meta-arm/classes/sbsign.bbclass | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-arm/classes/sbsign.bbclass

diff --git a/meta-arm/classes/sbsign.bbclass b/meta-arm/classes/sbsign.bbclass
new file mode 100644
index 00000000..a99c0218
--- /dev/null
+++ b/meta-arm/classes/sbsign.bbclass
@@ -0,0 +1,39 @@
+# Sign binaries for UEFI secure boot
+# Usage in recipes:
+#
+# Set key and cert files in recipe or machine/distro config:
+# SBSIGN_KEY = "db.key"
+# SBSIGN_CERT = "db.crt"
+#
+# Set binary to sign per recipe:
+# SBSIGN_TARGET_BINARY = "${B}/binary_to_sign"
+#
+# Then call do_sbsign() in correct stage of the build
+# do_compile:append() {
+#     do_sbsign
+# }
+
+DEPENDS += "sbsigntool-native"
+
+SBSIGN_KEY ?= "db.key"
+SBSIGN_CERT ?= "db.crt"
+SBSIGN_TARGET_BINARY ?= "binary_to_sign"
+
+# makes sure changed keys trigger rebuild/re-signing
+SRC_URI += "\
+    file://${SBSIGN_KEY} \
+    file://${SBSIGN_CERT} \
+"
+
+# not adding as task since recipes may need to sign binaries at different
+# stages. Instead they can call this function when needed by calling this function
+do_sbsign() {
+    bbnote "Signing ${PN} binary ${SBSIGN_TARGET_BINARY} with ${SBSIGN_KEY} and ${SBSIGN_CERT}"
+    ${STAGING_BINDIR_NATIVE}/sbsign \
+        --key "${UNPACKDIR}/${SBSIGN_KEY}" \
+        --cert "${UNPACKDIR}/${SBSIGN_CERT}" \
+        --output  "${SBSIGN_TARGET_BINARY}.signed" \
+        "${SBSIGN_TARGET_BINARY}"
+    cp "${SBSIGN_TARGET_BINARY}" "${SBSIGN_TARGET_BINARY}.unsigned"
+    cp "${SBSIGN_TARGET_BINARY}.signed" "${SBSIGN_TARGET_BINARY}"
+}
\ No newline at end of file
-- 
2.46.0


