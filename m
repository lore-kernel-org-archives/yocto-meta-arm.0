Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10ABEB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 13:09:05 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.11270.1686748143030728210
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 06:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=CDHgbbhx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-75d461874f4so206747985a.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Jun 2023 06:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1686748141; x=1689340141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4UgZbczwpYFX8A0yt0V5Fz6uaiG/05n79XFVzyDKbM=;
        b=CDHgbbhxhOTg3iQLk2gIYa1dqUnbsZUSG0IUKOdpvtmoZ3A//x6WKmfRqVzZb9zZe2
         Jxh8C4ccU6Uzi+C2ZgIaJd1XPp8ihSildLnDW2hGQwbFVSeRujnzPAxF4O6vtVcqsBvo
         ei7dTshPKuFgiRV+dhWP3I0g1wvlQsZHJWLxKE6LhEEn++ZEr3ILcNqFNbNvMznTGfAh
         /TwRRpf7OyfpepcF0sLUb9T8Rjug26DcxGjVrk7mpdx44lYai7+SHq2jki80lTO8H5bT
         2s7fD4uGzqyvYd4LEUC5Ogqeb2Mx30C3YdCwMb81ajyY6O71GzDABZilTZU7ply1ZBht
         C2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686748141; x=1689340141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4UgZbczwpYFX8A0yt0V5Fz6uaiG/05n79XFVzyDKbM=;
        b=iXq/4fVfd2h566UbVJcUVg8WKP2bi4DWWebT5tAS6kDSjZzWnebMc+xoAYgXTI9Nrn
         WPWHiQuPuKCo9nwrjhYpE/NqaV60r0j+uDaD2yPt/3bqTi9wImAW2V7+N5eY6JDi8jGd
         P1Mx/oT6A0j9/kdvtYQugiVlj2w8gRsrVILDl4VEWD1j8NMYuCtDy1+/Uhkl8/VWUZwA
         PeMxsOHn2++15OhJukHf1t9dZqF6NjIkZulEMwtOcTJh8o0n9QMxIuvwTx55UJt4zOtO
         0noqDXY1rlmdsRKQirHc+EPBQDSnmXnH2Z6XAIAkTB+shXznTJcKoIhBDMdJ4+57rJr4
         F6GA==
X-Gm-Message-State: AC+VfDzQJw+QZPfIOO/aNt5ACLvuxOGTPIUd0SVnAF8dDKlOHZHinlUM
	G83DBtRV/5o1d2Ac3BsS2FEqgl7MLsMp5s/BV2A=
X-Google-Smtp-Source: ACHHUZ4hJqIvTFm4XVZKJWpEV4yqAQnCaJbfYg4TP9tnsBTmej7qCcYmIkEfhlz5KTR4rk/+fvf9Eg==
X-Received: by 2002:ad4:5dcf:0:b0:629:1659:dba with SMTP id m15-20020ad45dcf000000b0062916590dbamr17070572qvh.10.1686748141669;
        Wed, 14 Jun 2023 06:09:01 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id 6-20020a05620a070600b0075f04e2f556sm3212692qkc.33.2023.06.14.06.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:09:01 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v2 1/2] trusted-firmware-a: update to the latest TF-A LTS
Date: Wed, 14 Jun 2023 09:08:03 -0400
Message-Id: <168674808553.2420450.8600161262530043219.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230609171428.3319420-1-jon.mason@arm.com>
References: <20230609171428.3319420-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jun 2023 13:09:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4781

On Fri, 9 Jun 2023 12:14:27 -0500, Jon Mason wrote:
> Update TF-A and fiptool (which is part of tf-a) to the latest stable version.
> Also, use the tf-a tests lts branch (which is still at version 2.8.0).

Applied, thanks!

[1/2] trusted-firmware-a: update to the latest TF-A LTS
      commit: ba93470738f15238ffa47b495719e02a567aae7d
[2/2] arm-bsp/tc1: update to use the latest tf-a
      commit: 088c6825f55be50f880344d3fe7228af7de8164a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

