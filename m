Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A43C4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 02:07:37 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.3194.1714529250018601791
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 19:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=bj2skVd5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-69b5ece41dfso26464436d6.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 19:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714529249; x=1715134049; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1N1rYGPX4tYrLHLBP+fUzuCrOLnNbn7dtjwb4+/mEg=;
        b=bj2skVd56JBiE5rF6NOQqbFFaF/BII+v81KrfnR7pGiltSfAS+vLI4L0XZmktbyXQJ
         OTaa5WVNsxURlfzRKnxHThjyBenG1qg5aahoCUko+dsnvzyAXxoTHH013sxBHC0gAZJi
         SO16idqrlbgsvnDrSYdLt74c74yDh26tUwuKxx9IdGLhkJ/BgZ/fmLvHL2FMACLTPsod
         g1SCM1npvP3KLaPWbByuP2CtvlmW4bnrXwpVIoLrTnvwagDraWCd6EYQG3OSwDb6t5/3
         rXeaLP7uFNm16ZnEcKr1jYhrypbE2vVD2aOjf28/0tIUq/G15qJwUShM8L9YIot5m/+P
         uVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714529249; x=1715134049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1N1rYGPX4tYrLHLBP+fUzuCrOLnNbn7dtjwb4+/mEg=;
        b=HDVlWbH4Kd2teqr8s43GiPknD8Jt/tjJc4tbSwFHnnp61UeQW5BuED2NDcnvnKQGqC
         TVk5LD2x6MfhtQDGUyc5xbE3CmQy3z/pHI701owyNR/PT+euxy2pQOe97ITte/gQbXlo
         Gd1E+bZBcON/5KLRp/O1bUZQ0kL6/YvBiSPR3RdXK3NBNUMgYE1oZBC17bPHdKIuE454
         nGcghZtuX9jDPEGNJpgAhbfSUPoUQzQZUeDWvoy7dHWMQ6FsJEPpk3r3F+nI+hMHuSPd
         U5T7vDiRh1Gc0mPbry7FeASEifk7tk8+LmkLrJQsAzWGJgUnoinceKM6RKKd39re4OHZ
         Y3MQ==
X-Gm-Message-State: AOJu0YwVLb7iTXbUBAajoba1mXZuEPmXW+YWPRcGjkdmD62Sykxqadr7
	48CqERNOB0NYp4m0yEVeacZxU7dnL3NOYlQF1Opf3hYiECeSsGtr595a8eUht8wjE978DvRa86A
	=
X-Google-Smtp-Source: AGHT+IHqEAYLSt9bf8buxaYnoJLT0DgPDiuOMrMdrMZX0AuRWkBC8dI3FZQJ+C5pNIMrJVKDnv/Kcw==
X-Received: by 2002:ad4:5d4a:0:b0:6a0:d56e:4b30 with SMTP id jk10-20020ad45d4a000000b006a0d56e4b30mr1304681qvb.53.1714529248801;
        Tue, 30 Apr 2024 19:07:28 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id k8-20020a0cfd68000000b006a0d7565fbdsm1747706qvs.87.2024.04.30.19.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 19:07:28 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	harsimransingh.tungal@arm.com
Subject: Re: [PATCH 0/3] corstone1000:arm-bsp: Enable SMM gateway authenticated variables and Secure Boot
Date: Tue, 30 Apr 2024 22:06:55 -0400
Message-Id: <171452921863.3441774.16122913171709152640.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240430154654.26833-1-harsimransingh.tungal@arm.com>
References: <20240430154654.26833-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 May 2024 02:07:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5676


On Tue, 30 Apr 2024 16:46:51 +0100, harsimransingh.tungal@arm.com wrote:
> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> 
> These changes enable the SMM gateway authenticated variables and Secure Boot features
> implementation for Corstone-1000
> 
> Emekcan Aras (1):
>   arm-bsp/trusted-firmware-a: corstone1000: Remove unused NS_SHARED_RAM
>     region
> 
> [...]

Applied, thanks!

[1/3] arm-bsp: corstone1000: Enable SMM gateway authenticated variables
      commit: 12711d573479519dbabac2452aa132a95d5d7d10
[2/3] arm-bsp/u-boot: corstone1000: Enable UEFI secure boot
      commit: 25eec5ced277a9a9880485e80c43dacd398ccfdb
[3/3] arm-bsp/trusted-firmware-a: corstone1000: Remove unused NS_SHARED_RAM region
      commit: e20aac1b6b2dcb9ef38c79c7b52e4b5c2a1be4c4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

