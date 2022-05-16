Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5015C433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 16:45:46 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.49.1652719536223290070
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 09:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=526xSnjs;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id u35so12469868qtc.13
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 09:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jY4dk0Igv390q079c54fV/YZeJ81VoH8DG4XC3EEOVc=;
        b=526xSnjsSlMfB7Il5Vlq2Y6HN7e8D3+VE+y5Ve6oVGX2gsKuXg3/qgR6jiWy+7ybU0
         oO8YtZPSBMgdP40mYdvTaR8z1MHYaS8lYecJPPbc7A4E8Gkb28LI1SAE7jR/OaD8j291
         0Y7cT7MEUz+jioi/56/xcHrWhwUeYqYFbMIweJScEdpt6HSBHce2LEX7xI4tafm8+g4+
         b2GV0zocFOrqRGqR0n7vFz8U29m9WmQxasSmws0Uh2xVaJObtIcwHFwtWaMJDf/Brj+h
         mtBjSsmQLiJeiOGrzSrwQgPYt+g1T/vHEqoaRG3wgBcLTQPmwrZ7DPD+m3REd94s2t0H
         qmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jY4dk0Igv390q079c54fV/YZeJ81VoH8DG4XC3EEOVc=;
        b=0eOse796Fh7FVuz+awHqwYTN3BPqXlgkoeWjfoslukGc18KCtSh/+D/mgmpjt0QP5Z
         aAWtYGYJGKB5hkyziutKS/iQluk0A+P/DMN7VQvpIGMet/e8yc7mpArsoa9Y0cwYRR4y
         8CVv3mZoqht2AiAmhfj1MWC7dHSRfNhI0AokoswzCHJqPRrvCD4GmNVpkQGE9fs7rMDU
         7CeWtRPLbbt0KCNpm86I8GP15+eRU2xYfnf5Rv/gxn9kUkDKmtNFDnj7AWYnleQe5Fvd
         5zjRWsMImT1Lyoc1cz0I+0TjhVLOvehPdi19ufCHKDR5YxmyrHUsFwE/FpFfSm3xFR7W
         1gtw==
X-Gm-Message-State: AOAM5318YgJTD7XRrrZGPN5ZqV+o1Kp5qw0z2tGyUvJXU+3Os8t7SOeT
	b0RPnL/z1zuqR8I7uVJ7RYEyWP5rii7JtRiO
X-Google-Smtp-Source: 
 ABdhPJxy2A7KKBuHLA2aKWQV23FFEvlSPCptYNy6h4foOEeqeK0U9h15qK0kC8LIWng0z7HsY8OaMw==
X-Received: by 2002:ac8:5ccd:0:b0:2f3:da4f:fdec with SMTP id
 s13-20020ac85ccd000000b002f3da4ffdecmr16663178qta.432.1652719535179;
        Mon, 16 May 2022 09:45:35 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 o66-20020a374145000000b0069fc13ce1e3sm6155409qka.20.2022.05.16.09.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 09:45:34 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"vishnu.banavath@arm.com" <vishnu.banavath@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/tf-a-tests: Add recipe to build and install
 TFTF
Date: Mon, 16 May 2022 12:45:30 -0400
Message-Id: <165271953082.1465918.9950972257593635756.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220511135231.14477-1-vishnu.banavath@arm.com>
References: <20220511135231.14477-1-vishnu.banavath@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 May 2022 16:45:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3406

On Wed, 11 May 2022 14:52:30 +0100, vishnu.banavath@arm.com wrote:
> TFTF is TF-A tests that runs at NS-EL2. This is primarily developed to
> test the TF-A interfaces exposed to NS code.
> 
> Vishnu Banavath (1):
>   arm-bsp/tf-a-tests: Add recipe to build and install TFTF
> 
>  .gitlab-ci.yml                                |  2 +-
>  ci/tftf.yml                                   |  7 +++
>  kas/tftf.yml                                  |  7 +++
>  .../conf/machine/include/corstone1000.inc     |  1 -
>  .../tf-a-tests_2.6.bbappend                   |  3 ++
>  .../trusted-firmware-a-corstone1000.inc       |  2 +-
>  .../trusted-firmware-a/tf-a-tests_2.6.bb      | 53 +++++++++++++++++++
>  .../trusted-firmware-a/trusted-firmware-a.inc |  4 ++
>  8 files changed, 76 insertions(+), 3 deletions(-)
>  create mode 100644 ci/tftf.yml
>  create mode 100644 kas/tftf.yml
>  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb

Applied, thanks!

[1/1] arm-bsp/tf-a-tests: Add recipe to build and install TFTF
      commit: 43224b60b7360925b7c3b2eb825189a20e58d3ec

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

