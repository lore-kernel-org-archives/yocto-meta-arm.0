Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD55C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 03:12:52 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.5423.1639624370874523129
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 19:12:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=5a6gSfFJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id l8so24074837qtk.6
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 19:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3GgmA/zFm/JoE5rkS0r/GwvpxyZUcqwFFYETGOdmY2s=;
        b=5a6gSfFJASMqE6pVCXTR6K7+WN9h55dsjki6b5wBmnGz1D2H37uHf7UF/0q3yCzdUU
         PKSXw5EJcL64SBGXdBppr2ip2TKYNVvh5wwPEwmsbYNa7er5/UG3oAQN0XslM9kdYN7G
         5dM/YSWSp39pygn7WLjMejRGvrLmw9U4nQd8ElihiYbTPl8vLFgGICtHeJDfmdB8rjvH
         pcWDrSfBOkkWYlxALwoejZVPuh3gNRpUd67rDv6BLTiXd/8QR1AqTeTSfSLK91PlyiId
         rhh4rSLC6StG4Qn3fJd8dXBDRUEpGtZGTu+J7QCPJRShdg13tqfu21droXgvHgPGuhZU
         3Uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3GgmA/zFm/JoE5rkS0r/GwvpxyZUcqwFFYETGOdmY2s=;
        b=3jBouRogo0U0jyVsivNPyqQsnIg5pCBuL1loDYr9qhrhylEqvdKcZCR/zD0ZY0qyp8
         6yxMk1DH7Djfggwu2FY1IBomm9CrB7JXXHcWRQWZGr7nOoSsIAVuJlXF4eU1G/Yyhf7o
         VpPeaozHOoYyZLVnV41D/FUUkVIWwIugNqtNgm+zYA0tVHgyfT8UyUn3TWKoGBerH9mI
         Jni0uy6EmPonVzWtVs5gxO27dCgVudNMeWblzwT7bCVF1Hu4iqBQlZlg2hxlpjDnKaet
         PZixnSg/38I0Le2z9oqgsqBwFOgV/VvnGQdlz0A2buRm7yRLYzV4JhB/Z2lRhbvYeO2P
         eBTg==
X-Gm-Message-State: AOAM531tJAOuf1u2BMtGYy9Wii96ndbOAdWCNGHSNO/xleq2+NrhP0s9
	tscaChIm5AR33/DRp0aUG3c1oE23jvHbcYaU
X-Google-Smtp-Source: 
 ABdhPJxt5CeHx5eviUKTQiwJh4UrfoX1bDqI3UkKw7e9Y4FPhznxD0CATS9ECekQr9i8LatZIuYCUQ==
X-Received: by 2002:ac8:5894:: with SMTP id
 t20mr15358835qta.450.1639624369921;
        Wed, 15 Dec 2021 19:12:49 -0800 (PST)
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id
 x4sm3151585qtw.44.2021.12.15.19.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 19:12:49 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	abdellatif.elkhlifi@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH honister 0/1] backport corstone1000: update the FVP script
 repo SHA
Date: Wed, 15 Dec 2021 22:10:47 -0500
Message-Id: <163962424839.15698.13907447385183729550.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215180415.9537-1-abdellatif.elkhlifi@arm.com>
References: <20211215180415.9537-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Dec 2021 03:12:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2724

On Wed, 15 Dec 2021 18:04:14 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Updating the SHA on honister as well.
> 
> Abdellatif El Khlifi (1):
>   kas: corstone1000: update the FVP script repo SHA
> 
> [...]

Applied, thanks!

[1/1] kas: corstone1000: update the FVP script repo SHA
      commit: 7410a7f6211a8d41c75e0b032f2e4c7e9db98e5e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

