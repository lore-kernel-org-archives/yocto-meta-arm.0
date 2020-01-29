Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.649.1580319707876584556
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 09:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Wez5XFVh;
 spf=pass (domain: linaro.org, ip: 209.85.221.66, mailfrom: peter.griffin@linaro.org)
Received: by mail-wr1-f66.google.com with SMTP id m16so353850wrx.11
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jan 2020 09:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8OXlMAGPVAGZRnfXMhXzylYdLHjQjYBKcjMQsPHlB+c=;
        b=Wez5XFVhRbA2SNFY4lmpwbmNVy6FceO/HYfxfQ5F8HQeWMx6N0MTXPu4OMEyp+hTMK
         ue7hPGLZ1e7Ccl5NJl/wlGIbZdwPoYzLJhZuhZDwJs6WyazvG4z2FJVXbguDQnlx77Mu
         NcgIOvjeTcTm5+hploZhPmVbWCB2TCdHDNHFjJ53ThBMjid71CBASUf6FQzHZDqpHncm
         +YuS/hIgdZFceisUVs+c4ihm3DlSFHPNpT6iS1LY1unWK65Mxqbdunl7tnFc2tbGzpts
         FIzrN904VkkdSGpk15H3jjCVMIcU2RLa1btolNgGIE3k3NUHyFsbe6utbX5k0ptq0GI/
         EvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8OXlMAGPVAGZRnfXMhXzylYdLHjQjYBKcjMQsPHlB+c=;
        b=GdJZKpHll8Y/K8bx8NRioBK6dBMdExUlEs/o0zdrfaS3Q0xJouW+wvrIUZVJWMxXSl
         0D4gw6iPGFuvbLbCsjP72aidOJn1rlsZI7pIo8hkxyagm4Me+ZTk4bWJ4jCiXxzz7aWC
         GjDXRgFrpyiSV5iDQ+Hl48E7+z5t3K8gICtn26f5UvRprfn48OwTBTV/f3lkPZW/bd/k
         +RnGzEPbJQG1yv1Mm61JLmdVHIHPocs0JVLJMK77aJp6jdHJ2Hljk0jClGj8hbRLqCBt
         MvcWBgOTck4W5oni5Q6dpNEAFSKsJkhBC8AuPThyJ2y+ib5QB7CueP4iTkxADevEosgt
         HEng==
X-Gm-Message-State: APjAAAVD/ZXWOnJigVe0EDvKUS4xWLxHewuK6f5j9gWxOg4fVymLnCIj
	+h9feEjfvRpZmAI76f87iLmEHQng4nQ=
X-Google-Smtp-Source: APXvYqwEs2bVYubMt8CopQVjuBpsJQPGUUTxV3eHOWENb7gSJZc2hYw6XQHSPux02ak7gt3UlF/8VQ==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr38870906wrm.210.1580319706282;
        Wed, 29 Jan 2020 09:41:46 -0800 (PST)
Return-Path: <peter.griffin@linaro.org>
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust4998.18-1.cable.virginm.net. [86.31.179.135])
        by smtp.gmail.com with ESMTPSA id y185sm3231525wmg.2.2020.01.29.09.41.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 29 Jan 2020 09:41:45 -0800 (PST)
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
Subject: [PATCH 5/5] optee-test_git.bb: add python3 backport patch
Date: Wed, 29 Jan 2020 17:38:45 +0000
Message-Id: <1580319525-32054-6-git-send-email-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>
References: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>

python2 is now EOL. This patch updates to python3
but is a backport from v3.8.0 release.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 meta-arm/recipes-security/optee/optee-test_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_git.bb
index a6fae9d..3f431c3 100644
--- a/meta-arm/recipes-security/optee/optee-test_git.bb
+++ b/meta-arm/recipes-security/optee/optee-test_git.bb
@@ -11,6 +11,7 @@ DEPENDS = "optee-client optee-os python3-pycrypto-native"
 PV = "3.7.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/OP-TEE/optee_test.git \
+          file://0001-use-python3-instead-of-python.patch \
           "
 S = "${WORKDIR}/git"
 
-- 
2.7.4

