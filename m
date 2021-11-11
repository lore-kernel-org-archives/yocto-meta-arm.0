Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B17C8C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 13:16:26 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.10428.1636636585275533216
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 05:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RGCVWHz1;
 spf=pass (domain: linaro.org, ip: 209.85.208.180,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 207so11825527ljf.10
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 05:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mX/TJoDVH8v+7KzzzR+2FdEzoqUbPtpdLLYq0Qo6ens=;
        b=RGCVWHz1LTQC19q2hAkvlsWS991EmSdWiV90bTu0g4LkejkL7ofAPreRudQin23sYf
         vHPTl0TXE8CleCN/ZopoIM+6c7dMg3EhN1h1aTnnbgOC7abNf0jNrRWEhRJUBmSybCxI
         PqkCiFDibCxtVbq7qNUtdJFZCVxepnbpEWoDEkavxTfLPT4vTjpDWVSWsMvtetJFsiiY
         CNbxxY5BAmAWMh1If6Io4c6yMkaz/5Ebj9H8DnA3g2nxgdRdT6q/vEV4NPpRZTYV+aAv
         NPOTqimiWG5rzT7uMdRO4ffw/8fzqTfv3WADB3sEeUgLg7aTt+bBfMQUZBJczEWHNQUk
         n0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mX/TJoDVH8v+7KzzzR+2FdEzoqUbPtpdLLYq0Qo6ens=;
        b=hlpR7VSiWcc4WG2+k5kX4FgJTUdmdc0fOZtnu6r+2dAaBtFU1tcLAaTH18gZ5sGrLN
         WoJKo7mG/fqSpp40NU3qJ1CZGLzETL/Jo85ojaF+tPQDb/6KZUU0Oyr6pTJCJBtk6cPl
         RmDopkZXWXncrxjY45br5piePbWJApIOexkgAPh/a68xJ3XkPE1ZTUErHT5E9kJYZ+AN
         XJdKy3rhosmcYPIFnTNXwPFfXVVEN33QDATKpZ31xYzWfRdIbDxMbX7v/UrnPHZ2v8Zn
         1kYp+WzF7g3gJdRGEWD6mTDr8mifhdmT+iFAAkgGP9vPnPhLKgaFSwUxZ9WFKggXdv+h
         WM3g==
X-Gm-Message-State: AOAM531we1sbEtUt/0c3e34F4vkic1DJ/EEURjblZtJb/JJRZS6JzF72
	IC49iFXk9kHGG1GJ0iAHwjrq6N6aoVRmcA==
X-Google-Smtp-Source: 
 ABdhPJxBLNXzH9skY029kPo+52b90DNmXvCLdN5Y7cG7v8x4XKoANn7wu1inF7Qf7qk8U4ic53Lmng==
X-Received: by 2002:a05:651c:1241:: with SMTP id
 h1mr6895679ljh.468.1636636583393;
        Thu, 11 Nov 2021 05:16:23 -0800 (PST)
Received: from localhost.localdomain ([83.220.239.34])
        by smtp.gmail.com with ESMTPSA id
 g26sm256551ljn.107.2021.11.11.05.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 05:16:22 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCHv2 3/3] ci/qemuarm64-secureboot.yml: add optee and tf-a
Date: Thu, 11 Nov 2021 16:16:15 +0300
Message-Id: <20211111131615.16972-3-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211111131615.16972-1-maxim.uvarov@linaro.org>
References: <20211111131615.16972-1-maxim.uvarov@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 13:16:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2364

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 ci/qemuarm64-secureboot.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index b7f3cb4..a7e89d4 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -14,3 +14,5 @@ target:
   - core-image-base
   - perf
   - optee-examples
+  - optee-os
+  - trusted-firmware-a
-- 
2.17.1


