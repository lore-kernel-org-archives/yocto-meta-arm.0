Return-Path: <leo.yan@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906D1C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 12:08:28 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.6478.1655986105085310085
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 05:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=z6oeXHtz;
 spf=pass (domain: linaro.org, ip: 209.85.210.177,
 mailfrom: leo.yan@linaro.org)
Received: by mail-pf1-f177.google.com with SMTP id w6so11757880pfw.5
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 05:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yqXwBZQLLnA9om/bcN01lyrT6tKXa824xFcKGNovC+8=;
        b=z6oeXHtz69V9PcDNYcHCkkm+etM+Jlh45xbsbOwpoBNTNmHet+O1gFex/I5rTUYoSZ
         izN4gfX5hdpZUocWIUQPe/hd+plIZLG7WFBNG9sDErC7KyGNasvIOkIztX6B8HrzTNfW
         wbrbXGO86Hpmy3ouaFNxW0OvmEI2AcVpGAdVBAf3aRjM6twQlsSXTy3JY9tuLp4Jb/zG
         SSyMF3ZfZKVDnmDmLSMEMGqMkwzwqhUva0FUfZJU7ForVX2X2dLEGSsBv0qPTU+I6dCF
         aVhmcVoU77y/GdShW25Ghs7PtwglEteW3qVDwvh0ZU5MfCnBeHieJGFujRd++xCCilxN
         XBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yqXwBZQLLnA9om/bcN01lyrT6tKXa824xFcKGNovC+8=;
        b=vFGSLGALW7Hx5YF42xnlCdTF/sx+hQ8xquf0/E2UT0T56bJIAr0jQBl6Aj4Q+HdXNB
         BScPQT6cP0Eojjt3Qej55dbM6XsPyEBPQvs+6t/5MwrIalkitpndtucEXlHZ3LRlgnxm
         TdtklYW4PhJxjHDZhX8HWrXC/ED2qhhv4kkK++WB5K+uVZw1f2rdSfogFt4ljFotX8lu
         rUZMbrt/3jal1WCDlOSg/i3623qGxKMwSiwA+eb31J8MlH/a8GLET3NkwrwOztrr7Mo9
         CmGMVZRpiTx2Eu5fUw4TDoYFoVn+GWnj/oOZxgwm0Pg5d0s1Dwc/diMwLKERuoIcIJ54
         ysbw==
X-Gm-Message-State: AJIora8OSvZ+yWOGB65QEc8qvsuwDIStSJWk3eXWCS0NHLvRnhMwgy39
	xuiFneIt4+zx13yaQxjGWrdY8vOwGuV7NqFte1gZCQ==
X-Google-Smtp-Source: 
 AGRyM1thVBDAdPvM+BoVeqqKb6BQAEQkPSpfAq2eNOA7qEqECFaMyGPMpO5rt9G5Lkay2O6ssFLEKA==
X-Received: by 2002:a05:6a00:124d:b0:51b:f2ac:ef8a with SMTP id
 u13-20020a056a00124d00b0051bf2acef8amr40767628pfi.72.1655986104397;
        Thu, 23 Jun 2022 05:08:24 -0700 (PDT)
Received: from leo-build-box.lan
 (ec2-54-193-69-205.us-west-1.compute.amazonaws.com. [54.193.69.205])
        by smtp.gmail.com with ESMTPSA id
 jh21-20020a170903329500b0016a109c7606sm10699746plb.259.2022.06.23.05.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:08:24 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Leo Yan <leo.yan@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jerome Forissier <jerome.forissier@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2] optee-ftpm: Update to "main" branch
Date: Thu, 23 Jun 2022 20:08:14 +0800
Message-Id: <20220623120814.214530-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Jun 2022 12:08:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3534

Since the github repository doesn't contain a "master" branch but has the
"main" branch now, this patch updates to the "main" branch so can
download the repository successfully.

CC: Ilias Apalodimas <ilias.apalodimas@linaro.org>
CC: Jerome Forissier <jerome.forissier@linaro.org>
CC: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
v2: Fixed typo in the commit log.

 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index d282c25..3b4eb5c 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -19,7 +19,7 @@ DEPENDS = "python3-pyelftools-native optee-os-tadevkit python3-cryptography-nati
 
 FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
 
-SRC_URI = "gitsm://github.com/Microsoft/ms-tpm-20-ref;branch=master;protocol=https \
+SRC_URI = "gitsm://github.com/Microsoft/ms-tpm-20-ref;branch=main;protocol=https \
            file://0001-add-enum-to-ta-flags.patch"
 
 SRCREV = "d638536d0fe01acd5e39ffa1bd100b3da82d92c7"
-- 
2.25.1


