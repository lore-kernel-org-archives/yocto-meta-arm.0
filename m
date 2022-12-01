Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9876EC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 16:02:24 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.47791.1669910541436400594
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 08:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=UUEsvZWy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id g10so1499975qkl.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 01 Dec 2022 08:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJZwT3wwOVe2j16AWWHstkdYzj6xOrztRDSjx7nrvww=;
        b=UUEsvZWyR3AuIiIYsGYGmQB6FEC6e+aEV/9t+2MdbQWuVRRc9xd08Je/BPraLvMhfq
         eQM8gB1iVEPqHTBemAtb26hl6gGkBPfaEf/WDMdr/yi2resRKBagXiRmNKKmd+IEPt7Z
         DwIfjNAY5LPfVkSIyj5BmYnj+9WKuKvbp8Fbv03Xh2/WLJ+gL5gDY6orj2VTrjPazYq/
         8S3CQvtVVXMVAkQLrLHbIPtDFeIzW99dS3Su+uxPGGwMibGlztRPcNsqrvQjg0/SerAy
         FPcmy7ZlX4rk/uUdYW4haGPTtriwV7cSMwTSN/gQx+UKvcwRHM+ata8NuHh7rSO33n3A
         8IpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJZwT3wwOVe2j16AWWHstkdYzj6xOrztRDSjx7nrvww=;
        b=IEObIMIcd7qOO5YkxQS95qJPSMEgp79W4xCqB5MMLalYRKtaorK5XXzdn0NLwIrGOo
         z9rN7kSww6lvFHK+dKMaGn4Lu4cxs0a8WTJIhoO82GasBGmnrW/UUydpZc1rzJbRH/52
         plAQfZu0MHMrDIMhqIHrv3WBiDD25M3BDdZ9lwpyOcHntOCBX08pyd9pQtY/VGhNZtfp
         +rQlbm1/n4S/ScYlvEaBP5eBLaMFiJ7G5k6i7iaIBzls0zV3cGfX5DfshZ0Rd+YcAPH1
         UiGlxSrTktomQDsMQyN/ekjNwJpWTHO1k5U7JEdW6kSeLhM4RVLfupw0SoChlhj+tuwU
         NVzg==
X-Gm-Message-State: ANoB5plSfSrs7owCXLLGdY/cZnzOfBPJpktuLaPymYFCe2fW/llTKimF
	d9uD2Uro8JbZQdajYtt3oNtKKeUE5gRv4g==
X-Google-Smtp-Source: AA0mqf6AZhnt9IpawxMAmo0uxrpig+hiQlA0caijXtnY4a5DebTj8YUwd1qhXtGh/roKK02huaUUrQ==
X-Received: by 2002:a05:620a:3191:b0:6fc:8fbd:b1c5 with SMTP id bi17-20020a05620a319100b006fc8fbdb1c5mr10890178qkb.275.1669910539860;
        Thu, 01 Dec 2022 08:02:19 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id g8-20020a05620a40c800b006f3e6933bacsm403367qko.113.2022.12.01.08.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 08:02:19 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] CI: revert a meta-clang change which breaks pixman (thus, xserver)
Date: Thu,  1 Dec 2022 11:02:07 -0500
Message-Id: <166991052874.3823337.5440113263431081934.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128174213.194165-1-ross.burton@arm.com>
References: <20221128174213.194165-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 01 Dec 2022 16:02:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4174

On Mon, 28 Nov 2022 17:42:13 +0000, Ross Burton wrote:
> 


Applied, thanks!

[1/1] CI: revert a meta-clang change which breaks pixman (thus, xserver)
      commit: 4f1e45b6bd9cf4ff8d38f33f587d257ec1b30d6e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

