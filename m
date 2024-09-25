Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D69C369C5
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 10:04:36 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.12235.1727258673300033803
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 03:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yka1sNZ5;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f74e613a10so99507461fa.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 03:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727258671; x=1727863471; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQGnmmRi1nU16WY3QHiqFBdRs8QwatKcCYueFacwUnU=;
        b=yka1sNZ5ZzHKq2Bh32MS0mmQ7JYhEZna4FU3olaYCPs2uWQoL+hhgtdiinP9RY5fnH
         1M978sn5GoKJz0k8qQItiSCrAZzh88okuNc1x3DVnh9S9Fhf8iS3pJVr3g6YYf178r/x
         CMeVWdWo9n36m8KddTUwTPPC5o6UJvsxUYK9SZ2ioG0l1bzcD3ixh+GCpekjVpZxGSpa
         VwY92c6NKZNu92yE7X1R9IbMA3AOJ3Dl29Jr+KtrGwaamfEEFBP01AGjEgYIeiJZI5yM
         GraqqUs4MZgcapP78JKr1RczR+VFfaItD51p3PyHzWkD01EigsEd6Yo4Btuzpok/MHWT
         4p8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258671; x=1727863471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQGnmmRi1nU16WY3QHiqFBdRs8QwatKcCYueFacwUnU=;
        b=lrFuw29V5dmmujLAAAS47SEeyTWNBaqqN7o4+ejmWi3YkNGhE932NUMCJNwH3VpihQ
         TYRTx2PXWQoHSf15fTHt8RNnlfl4SVGoYbVqes4VQiQBuz7nw4bF5joOOo9KTiRuUxxj
         yc/tJESAQ/fjspGI5rUyGJx30buKCxxBsKmqriyX0FbTl7URilPJ1vdNanDw4KrnF22q
         gNr25XmQfDuX02GlpXp7gmsaAkzY/VEshYXaNga+e4z3TG9qc2tz8p9VaKsIHhtPEmUZ
         cYevtuoL+nBPhIXbjuaC/E4yYL5YvTrw6BF5FpAaHR35KAcIeEw7cJfeyc7mMNLjSUd1
         2FOw==
X-Gm-Message-State: AOJu0Ywkz+mmoYbAmNuLMktFtifE1U1Z0MYy6LSV71kSpBgjM1j1+nQk
	u7LCxsOmX99ei0nxk4qsgrGNfpOnTsjnI7Ca6pb11CO1piXH+9LQSl5acaGgjaMaqvNskYguN/I
	ZJQw=
X-Google-Smtp-Source: AGHT+IHy3XP+wXvz1dTizC1l6Wsf7q+hbICRiErWruQvezwQXBLO5e7HygsD2g4GgGU1UOrWz05lLQ==
X-Received: by 2002:a05:6512:687:b0:536:a695:9414 with SMTP id 2adb3069b0e04-5387048aa60mr2034225e87.6.1727258671283;
        Wed, 25 Sep 2024 03:04:31 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d9d9sm478631e87.253.2024.09.25.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 03:04:30 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v2 2/4] arm/optee: Add optee udev rules
Date: Wed, 25 Sep 2024 13:04:12 +0300
Message-ID: <20240925100414.73073-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925100414.73073-1-mikko.rapeli@linaro.org>
References: <20240925100414.73073-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 10:04:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6110

From: Javier Tia <javier.tia@linaro.org>

If a /dev/teepriv[0-9]* device is detected, start an instance of
tee-supplicant.service with the device name as parameter.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 meta-arm/recipes-security/optee/optee-client.inc          | 8 +++++++-
 .../recipes-security/optee/optee-client/optee-udev.rules  | 6 ++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-client/optee-udev.rules

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
index ddda2d1a..f387c805 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -5,12 +5,13 @@ HOMEPAGE = "https://www.op-tee.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=69663ab153298557a59c67a60a743e5b"
 
-inherit systemd update-rc.d cmake
+inherit systemd update-rc.d cmake useradd
 
 SRC_URI = " \
     git://github.com/OP-TEE/optee_client.git;branch=master;protocol=https \
     file://tee-supplicant@.service \
     file://tee-supplicant.sh \
+    file://optee-udev.rules \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
@@ -26,6 +27,8 @@ EXTRA_OECMAKE:append:toolchain-clang = " -DCFG_WERROR=0"
 do_install:append() {
     install -D -p -m0644 ${UNPACKDIR}/tee-supplicant@.service ${D}${systemd_system_unitdir}/tee-supplicant@.service
     install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
+    install -d ${D}${sysconfdir}/udev/rules.d
+    install -m 0644 ${UNPACKDIR}/optee-udev.rules ${D}${sysconfdir}/udev/rules.d/optee.rules
 
     sed -i -e s:@sysconfdir@:${sysconfdir}:g \
            -e s:@sbindir@:${sbindir}:g \
@@ -38,3 +41,6 @@ SYSTEMD_SERVICE:${PN} = "tee-supplicant@.service"
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME:${PN} = "tee-supplicant"
 INITSCRIPT_PARAMS:${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM:${PN} = "--system teeclnt"
diff --git a/meta-arm/recipes-security/optee/optee-client/optee-udev.rules b/meta-arm/recipes-security/optee/optee-client/optee-udev.rules
new file mode 100644
index 00000000..075f469c
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client/optee-udev.rules
@@ -0,0 +1,6 @@
+KERNEL=="tee[0-9]*", MODE="0660", OWNER="root", GROUP="teeclnt", TAG+="systemd"
+
+# If a /dev/teepriv[0-9]* device is detected, start an instance of
+# tee-supplicant.service with the device name as parameter
+KERNEL=="teepriv[0-9]*", MODE="0660", OWNER="root", GROUP="teeclnt", \
+    TAG+="systemd", ENV{SYSTEMD_WANTS}+="tee-supplicant@%k.service"
-- 
2.34.1


