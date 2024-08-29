Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658F6C87FC9
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:32:26 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.24058.1724949139433559891
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 09:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XElUKw2T;
 spf=pass (domain: linaro.org, ip: 209.85.128.177, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6c91f9fb0d7so8885437b3.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 09:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724949138; x=1725553938; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKeLT5wECjxCPh0q9TVfT28Dr9BXXolYW1ml7VAYpJM=;
        b=XElUKw2Tj05CA9A3RQaJF/QXl7hU1zD1bu3b+2GFVVs0TNj9HlMexRHfj6y4wGYg05
         CxFflvCvNnMxscDzFsK2u8pFvQ6c6roPXQCSdeNAShgMeMUOlLCN4PSlyzgdmF0mMtg3
         rD0LraD+O/9090ZUc/g9/SgjkaeghbagNQ/PkZwEHTkyqrITOJ3E4QQboFDBjXEnN6Wo
         sBa9DbGftz3jn5lihnLx99XF7LF4F8JQj33zwrA31lStdFOGFIRfnqauTydjcF9PEIzh
         wLwJGqry8bnkiT0mjgssuDU2gk/Ov3gzI9+Y7KPn+tevEWDP/AkSKdyrR/Onjuycn57b
         HI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949138; x=1725553938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKeLT5wECjxCPh0q9TVfT28Dr9BXXolYW1ml7VAYpJM=;
        b=KIhotXInr1stYYCd+WLFN+WRZSLwhKFvpCcuOEr0TnVn5MxMNPr9eFhgBskAOCQh7E
         slNx9lHAo8XcdSQLIUAHUn/wgfb7x5qWzDzCff1kPo0L5dSh/cTFxpmifUrzQtA0R9HR
         1Ydem9VJq7bXZ2bDXlcdlh42vDOdbdZeUm9BDUpM/v0L/6BYN7x3WvY6uoOBOhc64roO
         RfPeObELk3LFCXGUOs8oZ08Pyko6kSO3/c7MsMHfydcqoltykmRNuOgkBu2LG2jHaKc+
         m4mBGNqIPWo/LVKkb3eSWYlxUHklBaaeSEZDc17jbcYeCBQWJnBYdOPLmouFAyv57cOB
         201A==
X-Gm-Message-State: AOJu0Ywp5zIaE2yGwjXMHMsaOATUgtZsy7Dh+3AoV9eT5Th/54Q704cy
	+pcnO690f83lB1Og5Aiu1wpD3zWwwrWAOJZzgYBrc8BPdn3llM55gAXX4ujV8IITDQwYGTx3o+P
	c
X-Google-Smtp-Source: AGHT+IHZUHztSHKQb3MGYaKoZxvvJ4ErIVfLcNx/T2UTa3E4yU6gReXQmk8H5gnrk6+YKixMgWO9Jg==
X-Received: by 2002:a05:690c:d83:b0:61a:e4ef:51d with SMTP id 00721157ae682-6d275e337dbmr38820307b3.9.1724949138413;
        Thu, 29 Aug 2024 09:32:18 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d438e18asm2993517b3.60.2024.08.29.09.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:32:17 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v4 05/13] sbsign.bbclass: Add class to sign binaries
Date: Thu, 29 Aug 2024 10:32:01 -0600
Message-ID: <20240829163209.47945-6-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829163209.47945-1-javier.tia@linaro.org>
References: <20240829163209.47945-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 16:32:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6015

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


