Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE3ECFA778
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 13:04:54 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.21671.1728047086598445802
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Oct 2024 06:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QEicbRf4;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fac275471dso21283561fa.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 06:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728047085; x=1728651885; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r10k+yuikkzEl5olj527fHFx63Ru9Zav9f5Jq5K/5xo=;
        b=QEicbRf4xNkINRIyDdk/+T7TglYOK7W11/KZBPz1o49ZbKeLfIKHmfcJYezUpRPomO
         pkeBwwUz+A4b3LZexDTS/MgC7qsUvUVDes+5vtUxN5bzMQzetTH0YRzOs2MEwERhj47m
         gpjXsp48Fok5gDik36KfaQ3ZOANiBSFELC+vjkkAjwyqPdecdRJVOvAki3Yy/pCpIpY4
         vSRjhLx/fHVTmwuGUWh9mxeFqLfM+Zs3qYIHgWls/hOWze4EAXFts+eLILmCfDjH5NJb
         npFeqz8JJiykfy1R6rYimt3ilDdeRJ7qy3TCBbP/6kgtApwXVETK9DRLXHhh6fmog4l9
         cuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728047085; x=1728651885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r10k+yuikkzEl5olj527fHFx63Ru9Zav9f5Jq5K/5xo=;
        b=tWrKvGJ4t++dKa63+Edfkn2qRlrlF44XZNvvlhbUFKheLpNFIaU6XrMnpeK1K8wdLm
         caXjks0ivrywMN8W1jrHz+/FkVDL9hbfj5jOzBq8Q2bwqoGNDMyrTKTpNnGDlUQj1vNT
         iG0Dv6GBqzF8PSNLDBxTjQgrWXvyR61XnN9olmzVUQrJ3WUOixUsVdMvm0/yYYAAyPAq
         rO86pIOcV2DaEamtfkFNpkzRDWfIvvbF5f+SpQaYLATi0Wq9ehja6OkqdJskTWTBJgpf
         eMQv8ghvmFrtzkBaG9PghvfO973gI0JeYSLdETYDv6wlJiQDPCk4EFOug3YCRxT/N3YX
         t7IA==
X-Gm-Message-State: AOJu0YwzxpcKpeoSoxnWr66zuzw1jlj/5DM6+AthcBmtmP72v304BvTI
	y89hwoA2Ir599UtDs5OihcukhQAd6YrzyRQ/iLYwa9A5I0Hgc5+exioaCpi/3FjzwYP+iV43gwu
	BQe8=
X-Google-Smtp-Source: AGHT+IEE89IZBZrReLanGFWuXsyWNgJ3qzqKyX1MwwS33Uboc76F+N7/zTOIsMa0JTHhAMQn5ceJ1A==
X-Received: by 2002:a05:651c:508:b0:2fa:f3b6:a05a with SMTP id 38308e7fff4ca-2faf3b6a147mr10748421fa.14.1728047084591;
        Fri, 04 Oct 2024 06:04:44 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-7430-3d00--193.rev.dnainternet.fi. [2001:14ba:7430:3d00::193])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faeccae206sm4554691fa.137.2024.10.04.06.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 06:04:43 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH master-next 1/2] ci/uefi-secureboot.yml: include ci/meta-secure-core.yml
Date: Fri,  4 Oct 2024 16:04:26 +0300
Message-ID: <20241004130427.217611-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 13:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6166

Needed for UEFI secure boot signing keys.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ci/uefi-secureboot.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ci/uefi-secureboot.yml b/ci/uefi-secureboot.yml
index 0684266f..f647f4b1 100644
--- a/ci/uefi-secureboot.yml
+++ b/ci/uefi-secureboot.yml
@@ -7,6 +7,7 @@ header:
   version: 14
   includes:
     - ci/meta-openembedded.yml
+    - ci/meta-secure-core.yml
 
 local_conf_header:
   uefi_secureboot: |
-- 
2.34.1


