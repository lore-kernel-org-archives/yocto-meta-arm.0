Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB45C5472E
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 19:04:54 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.1048.1724094285395503332
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 12:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LHjVRLiM;
 spf=pass (domain: linaro.org, ip: 209.85.219.52, mailfrom: javier.tia@linaro.org)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6bf6755323cso27707376d6.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 12:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724094284; x=1724699084; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5+tBxeFbiWkfJkiZMiVStk0WUgY+OMHmCiMHBeRQPM=;
        b=LHjVRLiMMX4r8IoVWd5gslwpjEcFs6TODUB1MJaJqd+FLZ5roNLCkMgFOafiYRIGJC
         sa6ypJEP6eT0f1yzvWRUQ+zdVbqUXI8pG3VyC03ue5RTLV1mFZU+W0YAOLAMxxcQviQF
         4laC8W0tJJXADYI1ZLNDyhYT7qDeL2fORFWqbJNIyvOZQA4HRVWktSkBdWBmSuamI6Hr
         Wf9JqxgWu1D0BGI92ZAC+IIQsRkKsGLmqugR+LrHe+3CXJeP2Z3fF7NxZffcEgfCzx+m
         CXRRVy0oIgHm2h/KVDecih20FYU/dVPepqcd17q6eGwRNZ2eRINFvlyoy4SD/1ZbFpc2
         0sGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724094284; x=1724699084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5+tBxeFbiWkfJkiZMiVStk0WUgY+OMHmCiMHBeRQPM=;
        b=KeE5y4ZS3pw/WBR6f5Ieu/Ql/4W+YGUH8AxlP0Cb+2K1HY0oQYpmgtIobVFRmOvkKS
         /jm0wifcGTnO6rjzornAvZSijkgRAm0T1g0HkBPsCL9KSjlsUiWxgiUZv+OpcXLkmwTg
         IzgFRZxVWpX4gv7rwJckvrpTq5ttSlDDUB00VQSPbJt2lov3n2R18bmyWCePHZ0dbVeR
         k6tIxmcftf3fkKZ4H0aGPkYr3QlML7BW17+qO7wV9sMZJtipU6mxSrHX+0AAEc3e+Jac
         KjVwzBmHVpTk1jVV7Rj8sposbwsNQ9c4Axk7K/BL7aAZ4odwAKxZstEbRRtbbPJtDaVc
         tzcg==
X-Gm-Message-State: AOJu0YzZSXBGqdZAkgXHFrLehnQm30oEfJjEiggUyrCi46MjlmdnxWEC
	JwSQlBxa1ja8zc3mj/tg4F3l3O1sgEG+GXxG2vCfFEuNkhn9dPDLBkFCN3P3kqL32btqxfOtPdP
	H
X-Google-Smtp-Source: AGHT+IFvKL/xkufVRkZtTMzEAIDkYFrA3etYpPtNckcv59h93Ow8/ChnnBvscsoNpT81lu/BHxcLRQ==
X-Received: by 2002:a05:6214:524a:b0:6bb:7a04:3408 with SMTP id 6a1803df08f44-6bf7cd85850mr159229366d6.11.1724094284314;
        Mon, 19 Aug 2024 12:04:44 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([177.93.4.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe06feasm45371756d6.40.2024.08.19.12.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:04:43 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v2 09/14] qemuarm64-secureboot: Add meta-secure-core layer as dependency
Date: Mon, 19 Aug 2024 13:04:24 -0600
Message-ID: <20240819190429.2897888-10-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819190429.2897888-1-javier.tia@linaro.org>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 19:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5975

meta-secure-core is required because of sbsigntool.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 ci/qemuarm64-secureboot.yml | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index b26941e0..958a1ff1 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -4,13 +4,15 @@ header:
   version: 14
   includes:
     - ci/base.yml
-
-machine: qemuarm64-secureboot
-
-target:
-  - core-image-base
+    - ci/meta-openembedded.yml
+    - ci/meta-secure-core.yml
 
 local_conf_header:
   optee: |
     IMAGE_INSTALL:append = " optee-test optee-client optee-os-ta"
     TEST_SUITES:append = " optee ftpm"
+
+machine: qemuarm64-secureboot
+
+target:
+  - core-image-base
-- 
2.46.0


