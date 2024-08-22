Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DBBC52D6F
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:43:58 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.4150.1724291028705999907
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 18:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=g1dN9+SE;
 spf=pass (domain: linaro.org, ip: 209.85.128.173, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-68d30057ae9so3293077b3.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724291027; x=1724895827; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKeLT5wECjxCPh0q9TVfT28Dr9BXXolYW1ml7VAYpJM=;
        b=g1dN9+SEImPwWexkqCqT4/X6YIMuKwOr61pWmBGH7DAff2/+6PA2vpEouXm/vy7t0a
         IqwrRSB7rkqMGsTG8cKMy8YP9j5wptXM4+FWD2Bw28gwLJqNYFLzX4nrI9H67w9YY5f2
         rvswCB84BdiQy7eSty4mgTrwP2FPKL5yT0crWgRLusySJc4qGpfJ/Wg5cAGMVxTdjeU/
         82mLcG4ZbAm7brIiV5y3W99m0D+yWVvZlQXI4BJfFpGyfRUaDUgXmz14wwrYFHrtyAV3
         GEKmyc9fR7x+FPv7TmYiXGulNRL/aBzWYGEefV/xvJwGPt3MDtK7QqRXlOa0j/GgoR1z
         wHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724291027; x=1724895827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKeLT5wECjxCPh0q9TVfT28Dr9BXXolYW1ml7VAYpJM=;
        b=XCTJKjy5pUs3u/INJB1np4dgEBs9jYW2fSnPoP8T9XTpiEkYgjG2GKPDu1QbxZpFEp
         46272noE9JGn9FWWLc9PmcshFtgwdjVaWorDurCTf4rwtlYjng7IMrtOfeA7dyHNaFlS
         BOm2+dBWSBC6EVwqb0NWfwynrEC/CnTvCKvKFe1BNxYW/H2nA5jN4KU6nZ20QKW1nyFC
         CAeYh5ANVHKHnp65ASdrIsZWrE1g/YLnqTGTAJFuIRXGq0WFyaX84TqA9op/GGHOc6W8
         apDb0NIxgppW7QQtM9xC1pY3qQDUWsxxQZTVvO1Ebq/LGeISrHE6UFlHDIR481OmhUth
         7ijg==
X-Gm-Message-State: AOJu0YxfwWtjo9sd7mrIWaCyvgGBOuj9yM5c8EPSIjkMUcetvY/FhZLf
	JJYxtvo+7S4I+LqD/lqZ94zXP5KbcJeXOBDD82XO+jve9XnFnnSIjB4zjcstxfr85EPf3KNxCuD
	S
X-Google-Smtp-Source: AGHT+IE21Dx7RFcLUpQgu2zmo93kapXCcQ7giJE7sFEJOkvZNnaABEUktMLb7OQ4d6vfA/RRUCMYsw==
X-Received: by 2002:a05:690c:768b:b0:6b0:e813:753b with SMTP id 00721157ae682-6c3d60b85aemr4020857b3.38.1724291027645;
        Wed, 21 Aug 2024 18:43:47 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e6eae07sm707757b3.145.2024.08.21.18.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 18:43:47 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v3 05/13] sbsign.bbclass: Add class to sign binaries
Date: Wed, 21 Aug 2024 19:43:27 -0600
Message-ID: <20240822014335.3394568-6-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822014335.3394568-1-javier.tia@linaro.org>
References: <20240822014335.3394568-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Aug 2024 01:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5995

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


