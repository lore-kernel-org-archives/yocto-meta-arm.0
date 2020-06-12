Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.17326.1591957965075015004
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 03:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SD2px/Eg;
 spf=pass (domain: linaro.org, ip: 209.85.214.194, mailfrom: sumit.garg@linaro.org)
Received: by mail-pl1-f194.google.com with SMTP id j4so333812plk.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jun 2020 03:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QrZRcSgBKjSR61Ne7OzusLceByzk6tgoHYYBIiPxMgM=;
        b=SD2px/Eg5j1q6j03O2ksHRhzyP2mFDH1EBPZudrWjl3EafHGTyO+8sicM710bbqSro
         LPfYDsQ6+Wr5uu1AlQwpo43WbQjW+Ka17jtt3tYttC9ETn65+0+mn2cVaoPiLnspakjy
         1M3qRT8st2vjOhPHa1rWGlt9PsEAA3mzabRhcPb2xpKfCUlKfkHZGVnYRYy15svyHswo
         RPpOdnu5/GSgurC7mJXkajLima4beYlmSLGJRG0I181DHe5MydWdQ6R9xBW7mvqJ9sus
         7jT/mbJtUQ3O0GV+b3mXNPXme0I/K8juLEB+wJsO9bdhqyZBsv4DvWJACHdigcAahZHX
         C0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QrZRcSgBKjSR61Ne7OzusLceByzk6tgoHYYBIiPxMgM=;
        b=noGKNLg/cz30I7+ilf+zWcsDjAumwWS3jt7mZahiCjb4cMlexawzqBSOVey7ZJM1Ht
         tUqfx6NriRc/L/6OWLzVagb6Hjlxk6lRh4QWNGbPJWrX1CnvRXAKKj+i8QWY44WQBLSY
         gCfcf3qpwKCMaQYaEkceqShFDTFJOQM3niJlWU/qUeIIAK4C5poVDYRQaYNp4jjlLCdO
         J3jIg4vhfoZoCCKxJQQ1YaQrY0GAGM+oX4wck5KO4HfOpGhDbfB3VNayJmpGgGA29CC8
         3ZXZeYTAoO7ocAB/quf9V6aV/64EpDDeZR6t91DJ+1bWYhInxcvwsT8QpRozXxTIezo8
         JWBg==
X-Gm-Message-State: AOAM533pyxhXjIU9URlJRoe5n8wEPmnxJ9CyaLAJGRDoJTZxSITIXrp3
	pjvi7hzp5M2NQcM6EKA3JiTiOtLqsME=
X-Google-Smtp-Source: ABdhPJwgZo60kqkKu0zFNbYM6XdlkQzCKI7mup3Tu91/9EHJfkRNtFT92nSJJAyIhIBxZuPgscioIw==
X-Received: by 2002:a17:90a:d3c2:: with SMTP id d2mr11743363pjw.202.1591957964176;
        Fri, 12 Jun 2020 03:32:44 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.64.69])
        by smtp.gmail.com with ESMTPSA id y81sm5871606pfb.33.2020.06.12.03.32.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jun 2020 03:32:43 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	richard.purdie@linuxfoundation.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v3 2/5] external-arm-toolchain: Refine dev libraries/headers packaging
Date: Fri, 12 Jun 2020 16:02:05 +0530
Message-Id: <1591957928-5959-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>
References: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>

OE core by default package all libraies/headers installed as
"${libdir}/lib*.so", "${libdir}/*.la" and {includedir} as part of
FILES_${PN}-dev" but in case of external Arm toolchain recipe, multiple
packages are provided which needs to include specific libraries and
headers. And "${PN}-dev" is only meant to pick up remaining dev libraries
and headers that aren't picked up by other packages.

So in order to achieve above objective, re-order PACKAGES list to shift
${PN}-dev towards the end. And since some static libraries needs to be
packaged in ${PN}-dev, so we need to keep ${PN}-staticdev later in order.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 .../external-arm-toolchain/external-arm-toolchain.bb        | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 8cfc208..73a2cf6 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -305,6 +305,19 @@ PACKAGES =+ "\
 	linux-libc-headers-dev \
 "
 
+# Re-order PACKAGES list in order to shift ${PN}-dev towards the end as
+# it is meant to pick up remaining dev libraries and headers that aren't
+# picked up by other packages. And since some static libraries needs to
+# be packaged in ${PN}-dev, so we need to keep ${PN}-staticdev later in
+# order.
+
+PACKAGES := "${@oe.utils.str_filter_out('${PN}-dev', '${PACKAGES}', d)}"
+PACKAGES := "${@oe.utils.str_filter_out('${PN}-staticdev', '${PACKAGES}', d)}"
+PACKAGES += "\
+	${PN}-dev \
+	${PN}-staticdev \
+"
+
 INSANE_SKIP_${PN}-dbg = "staticdev"
 INSANE_SKIP_${PN}-utils += "ldflags"
 INSANE_SKIP_libstdc++ += "ldflags"
-- 
2.7.4

