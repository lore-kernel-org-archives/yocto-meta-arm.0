Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B0FC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 13:32:21 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.9165.1648042340553971615
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 06:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=AfpeRn1x;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id s11so1109897qtc.3
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 06:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LGveAQ62LMfnKhU0DntuYNg6HrpNxPtvA6lptTC76Gw=;
        b=AfpeRn1xLOTVdTDUsA1g+vi7y36mNF8NsqkFNGOSjEODw2yJePsI5ycbfXU5k2JOY4
         FH8va8rSUeUK5C6Lfm9WzkSISdobBqdO8jp1+YwOlRnKcZ+nYeeTqQvqMreEXWNri34/
         k+EHORcyM0tb9wU90Fs0qIZh724rA9q8FdlWcKluhRPGtXDrT5ZZlRQ43LFA2TTrXTeS
         UNlloTBDng5njL+53bUlS5Iy3q+4MaDHjQPZXdqqScFq1LCwFOf2X/tNxI13P0Puboas
         ifZtbOCb16g6wB7PjazRhF9MvllC/fr2OMqxbnKxj0/Nvafk47mV5KXs01eHevq8ZXb/
         1VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LGveAQ62LMfnKhU0DntuYNg6HrpNxPtvA6lptTC76Gw=;
        b=AO6rfBAm7pvPVv2QPAr/C+QCC0fmwRncd5DfcC88ih8gwTODthEEKEMxGmhscqzi8s
         Dl3nbfAJynirbWwoCdRm2+3xzsA26NI5fF1VDG+JNVd0SpC3mtZTAw+s2JltKvsJi53x
         LMZ3NK1VSPJOuXFvCyFRk4MljJhR35eEF+KJDBDl+f+y1MQRtPX70DkVTjOPMpkpb2Ug
         qjc/ptvQKWiR1KD1T/5uC19185G7sBShmKkKvf7pkwuhz6M0/ZNoV36zY5s5EP4RkU7v
         +ePSoATE0WiiENjHZe06OXQa7SfPHBNBpk10mTsmXL+bZGfx95aoupNh1hcbKZl2nIk5
         13RQ==
X-Gm-Message-State: AOAM533IrVSDsMZcVGI+ooh2XIwJGX4TcXP/6PC5xd7JQycaWhNdw5XK
	60pZEA9hze+ThNGTWvkMRwpDxK0UK0VDYA==
X-Google-Smtp-Source: 
 ABdhPJxAY20zrzrPvOJ1tmE2kO++IbskHiKR6mOXv1s89Moo/MFZsQqmH3Jqd6vQcujPc7yXLweDkg==
X-Received: by 2002:ac8:7d91:0:b0:2e0:6b65:c76c with SMTP id
 c17-20020ac87d91000000b002e06b65c76cmr23893069qtd.564.1648042339458;
        Wed, 23 Mar 2022 06:32:19 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 20-20020ac84e94000000b002e1d5505fb6sm30702qtp.63.2022.03.23.06.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 06:32:19 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/4] arm/oeqa/fvp: show more log from the FVP on failure
Date: Wed, 23 Mar 2022 09:31:20 -0400
Message-Id: <164804228335.3978431.18219748160795969024.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220318165422.1711512-1-ross.burton@arm.com>
References: <20220318165422.1711512-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Mar 2022 13:32:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3201

On Fri, 18 Mar 2022 16:54:19 +0000, Ross Burton wrote:
> If the FVP fails to boot, the last 20 lines may just be a stack trace.
> Show the last 200 lines for further context.

Applied, thanks!

[1/4] arm/oeqa/fvp: show more log from the FVP on failure
      commit: 00cde20a9abce366dad1087379a306fe81ceaf72
[2/4] arm-bsp/fvp-base: consolidate FVP configuration
      commit: 583b68cc90380c452278f90feb93409f186dec8d
[3/4] arm-bsp/fvp-base: configure the FVP with v8.4 cores
      commit: f56e69e1356851db19a62a291b24488f73abc443
[4/4] arm-bsp/u-boot: use latest u-boot for fvp-base
      commit: bff49b6a351b2a142cb12cfc97de563ed337ec20

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

