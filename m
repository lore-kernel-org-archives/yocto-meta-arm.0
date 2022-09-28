Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DE2C04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 13:42:49 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.8016.1664372558629076542
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=sXS7nph3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id g23so7930642qtu.2
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mrhywMYWDQUSXHP9NeH43+by/xrIQs0hmpZ39qWAMtk=;
        b=sXS7nph3YHLmaw2q50GQOcPzZn20Hy+CQ6uJJgv+Hbsd2fp56pyLJfiMkTM0vLpV9a
         aczzgrUrNZXJspXjpylDu0BDIA6tNeiElGWahZnDoMNEA75q4vhck4s4KJuMAgIhbahL
         IQFhWoVnxB7ChJBxw8HWyGlEEjXMrmI9mEyecme3/oEJnEZNkedAAms6qhXaXxLx5pbh
         xjLzABbEPfMhSsYK/pCuNA4An1dFnESbQvgZbkJOlsF+mAL1GR2BJ+NjD1koUVGibiEZ
         YuZitJI1FHFR6cqnDQFszV1YAAD9v0bpwnupRwOXsuxWHnfo9390p6lS4wmH8iEMJcEo
         6hcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mrhywMYWDQUSXHP9NeH43+by/xrIQs0hmpZ39qWAMtk=;
        b=J2zM2zW7QITteBhhTArsmy/HMbOLI0ximFPgiLwBp1OQacibFXuRgWDF7MspgwDpiN
         5ypH0Y7UjMSEUAzfNOCDND1bvadHWOJ/tsF+1cGkHV+ywcs+03JaFJm5jQGhPcTNfq+e
         hOMsCGenlBDKGmfF4RZVjwgJ2dNH1+iMCupx+Vnsjpzzpc/k86Ss0eDXyhEABjieF50T
         1Enbg4PkcMC+oo5+vDB8e9AliS1iZq4j2F2WEwVASyAD4aowpzWNVEGCMAsQbU0amioQ
         h+WRu2eD9HhiR/YnLT2kP+0PWJSZKWO2mJSpCq3cGAb6cswtLAgQUuK+rmy/MVM/Avl4
         XGZQ==
X-Gm-Message-State: ACrzQf13TRtsNTA/Z+rsIE3286guMpTEp5g+iM7/bvYC1JRVjNw/qoLs
	9ZVTqAFccmzFzEul6YEFTtJxCS+ZFGNsjShV
X-Google-Smtp-Source: 
 AMsMyM6/mhltmBcSTet+PF+5i0HeVhxN9PAUJyoK1Oa1spLBklw/rDEo1Q8PJ3vT1NICPcPOpF5D+A==
X-Received: by 2002:ac8:5b8c:0:b0:35b:b653:70cb with SMTP id
 a12-20020ac85b8c000000b0035bb65370cbmr27161641qta.477.1664372555369;
        Wed, 28 Sep 2022 06:42:35 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 r22-20020ac87ef6000000b0035a691cec8esm2793656qtc.29.2022.09.28.06.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 06:42:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"xueliang.zhong@arm.com" <xueliang.zhong@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/n1sdp: upgrade scp-firmware version
Date: Wed, 28 Sep 2022 09:42:02 -0400
Message-Id: <166437252283.2315819.11701394845750193103.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220926171806.12213-1-xueliang.zhong@arm.com>
References: <20220926171806.12213-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Sep 2022 13:42:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3858

On Mon, 26 Sep 2022 17:18:05 +0000, xueliang.zhong@arm.com wrote:
> Upgraded N1SDP scp-firmware to N1SDP-2022.06.22 version.
> 
> Xueliang Zhong (1):
>   arm-bsp/n1sdp: upgrade scp-firmware version
> 
>  .../recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc    | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Applied, thanks!

[1/1] arm-bsp/n1sdp: upgrade scp-firmware version
      commit: 680954d6e90ab78dc1b5dc656f4b046f187f3a4d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

