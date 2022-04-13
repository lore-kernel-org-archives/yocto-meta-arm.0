Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FB7C38162
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.3638.1649881845976583203
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 13:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=PbplPlZQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id b189so2372557qkf.11
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 13:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uEfMxqKhShwKNle0uWxh9ZnkkvKht6/0Q41BXLa144Y=;
        b=PbplPlZQ4VfGhsYbxoUB3L00sKCrSAE5V9A12eIE8Qzy3/I0ffbLuHxjIt6jC079+O
         PR4MEYZhNeLeBIIciBGoVIyLZEfHIogJxl+lgi3PmAsWtjsdcq20doHJQI6g5e38Xtu6
         K8DgvxMgK+QJquYUTAXPqQw7mQK9NYUG1icGXnnr1fWJlgHY8oTMWOnN3h8GTsTksxd+
         6R0fuwJ9dL4mFkGDCCNVGW9GBctHx7vY5Lydg9+IFcZ58LIC9N4v47fIPp4DdPzr8Hfw
         T4yjBguXThpqwtcLFIdh4SzPivmOVOsGqXvIOZNmyw8ZPjR3ArvRWf+IIO5xSemwBHms
         afkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uEfMxqKhShwKNle0uWxh9ZnkkvKht6/0Q41BXLa144Y=;
        b=U9cEa4MgU1Ei86vn1TySnsgAzmGV1959z/k/U0Leo+E0bgI8pkSOdbgTu4tId+eIbc
         5GUvRXCzbpvO4WioXwzYoaUUY8ia3sxSCuBl4NTEGbjv0j+4y68LUOpsctKoxq/0rLgk
         7DY1XZrO43j/iRkr0qggKOs58muwXGjmzbha8d4brqq5kCv6PJ3RbGbkdpMRm7j2/06i
         pzGOvbWbkrTzqzosXqf9aTeB5Tjgc39rw4nQMQYASHZljZYRTwBLLYKMDPg/uGKHiGoE
         kx0zH2n48NfeQukCKqqCMrckPUKKC9vifZfCGBDqfX51IunO7QHdj809uiU9OvaCnyqo
         BtJg==
X-Gm-Message-State: AOAM531AbFUyOkFhy6SrBVC+1hs8fNyGPSmXCDm9X26fbMm+NVPMrSnd
	fAkvMnB+8hU8rTgeGR75AwRBG1ZCUWPoMA==
X-Google-Smtp-Source: 
 ABdhPJyFLHu7HtB0/F4K2akr50+59ySbdyEOa8BwIsdU/xkDYr6K1ym3z//WfdkOceJxX6ckk7hwgA==
X-Received: by 2002:a05:620a:2a08:b0:69c:2eaf:be85 with SMTP id
 o8-20020a05620a2a0800b0069c2eafbe85mr8323029qkp.382.1649881844980;
        Wed, 13 Apr 2022 13:30:44 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 o6-20020a05622a044600b002e1b9be8e6fsm29735471qtx.36.2022.04.13.13.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:30:44 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	diego.sueiro@arm.com
Subject: Re: [PATCH] arm-bsp/linux-yocto: Enable virtio-rng for
 fvp-baser-aemv8r64
Date: Wed, 13 Apr 2022 16:30:32 -0400
Message-Id: <164988183534.257858.5629540203740689720.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406170915.304097-1-peter.hoyes@arm.com>
References: <20220406170915.304097-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3272

On Wed, 6 Apr 2022 18:09:15 +0100, Peter Hoyes wrote:
> A virtio-rng is available from FVP_BaseR_AEMv8R version 11.17, so add
> to the device tree and enable the correpsonding FVP configuration flag.
> 
> This improves the boot time and removes the following warning in the
> boot log:
> 
>     random: udevd: uninitialized urandom read (16 bytes read)

Applied, thanks!

[1/1] arm-bsp/linux-yocto: Enable virtio-rng for fvp-baser-aemv8r64
      commit: 4c2f4ab95e3aee2c12d9dcb6fc4171acb42cd1d3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

