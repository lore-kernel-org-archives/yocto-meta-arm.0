Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3D2C4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 17:17:06 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.833.1668532624275043710
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Nov 2022 09:17:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=nmMbLJoa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id i9so9912988qki.10
        for <meta-arm@lists.yoctoproject.org>; Tue, 15 Nov 2022 09:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3N2hjW33JRBDVAsKxkMJKYmV1LLFLggI+7ww/OYnSU=;
        b=nmMbLJoaEOZ3DnqJb5n3XCVN8NS4w1MshPaoFBWgUGaxQdYDwMQQuMMnWH48+d+azE
         92Ks0W9qTdOAXLfxZQjDtCIF/Y6cDMzB+FyfTVpnbNuLQ1Yc76eiCx2L4sTOOVDZVjgY
         TOQQwr+pbl7zMeNWVisZ5Enx9UW+s5J+di2oNfHxilRjgcdV1egpfbBe/jH2vKhbg18r
         vWOxZA0ulAg/5MpCDrIvrzKRIXsQPkTjhKVTNiKQXjJvDaHvxuIX2fnXlzmVK9v4sRM5
         0+p1YV9603Tjts0j7qsFL1qz6GeKwzhTCUJ9RJ29dKQttLeccdZWyRdfU67AiJfC9Y0s
         Un4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3N2hjW33JRBDVAsKxkMJKYmV1LLFLggI+7ww/OYnSU=;
        b=TNf/H8A4lN2sZusjkX2iVXGybTGyWde4nxIF18pMUtz9B39RQtvGCQirb/WmucYvjw
         snthoFa2q6k1J6LkU9xzqP2TNK6wp7/93EHQyYLw83sheq/v1XC4jk3hU4T0Sa1JIMos
         JL3JXY+QSgfc74sltUXXXXCamwxZexWzwoQLKFAdCPGP/O9hsIhzU8BU0S7a4rH35Do3
         /H8bkOWesGiudoGdh6rkZdJ+At/rTD32jkCQF1EK6lpR+kBkzBW+qMNSkGAP6s2C9EWo
         VAphZZBMBRopkVWKKJjMprcoXrLbeSmTiCrK4CYe3kzifelUnbx/ONiOe6iAmPFulv2H
         aTPQ==
X-Gm-Message-State: ANoB5pka589y58DNvNA/mgSeg4vahWPr7ZuRhNtQWxbuAv34Jh0pEB3n
	Jfv+z5LzYb6ewIHOF+8BkWh6g+beCj3X8A==
X-Google-Smtp-Source: AA0mqf65p3tfc3EIZxncfD7u3PkJDMCxlnC/d6OMY2Rw6xlmwZ4Pe0RHzTkzHdF+TvNzf4Vb7Oc1JQ==
X-Received: by 2002:a05:620a:cf1:b0:6fa:3148:9651 with SMTP id c17-20020a05620a0cf100b006fa31489651mr16098629qkj.780.1668532622989;
        Tue, 15 Nov 2022 09:17:02 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id bn4-20020a05620a2ac400b006f1187ca494sm8391662qkb.28.2022.11.15.09.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 09:17:02 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH 1/5] arm/fvp: Join cli arguments in verbose logging
Date: Tue, 15 Nov 2022 12:15:07 -0500
Message-Id: <166853250757.3687205.2379412966126691251.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221115150116.314729-1-peter.hoyes@arm.com>
References: <20221115150116.314729-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Nov 2022 17:17:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4135

On Tue, 15 Nov 2022 15:01:12 +0000, Peter Hoyes wrote:
> It is sometimes helpful to copy and paste the cli arguments from the
> verbose runfvp output (e.g. to test with a development FVP build), but
> currently the arguments are printed as a Python list.  Use
> shlex.join(cli) to safely join the arguments together in form that can
> be reused directly in a shell.

Applied, thanks!

[1/5] arm/fvp: Join cli arguments in verbose logging
      commit: 721bec250d5c0430591455350c02108769ba095a
[2/5] arm/lib: Factor out asyncio in FVPRunner
      commit: 81e0cf090b6b98525c3caf620214f1602de20800
[3/5] arm/lib: Decouple console parsing from the FVPRunner
      commit: 2265bffdc7ed80c0a1fc74180acb6d1d46b3120c
[4/5] arm/oeqa: Log the FVP output in OEFVPSSHTarget
      commit: 79e78fb31d84d0e55eda47603d76d413d48544a1
[5/5] runfvp: Fix verbose output when using --console
      commit: d5f132b19920870526c3b03c6a932ebb7949f8c6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

