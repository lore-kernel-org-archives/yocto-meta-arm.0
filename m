Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A74C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 19:50:47 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.33335.1660765839188629331
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 12:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ZvZ0Idbw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id y18so11199308qtv.5
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 12:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=3/UP3x6qrBkioKmmxeXrh4pZXQ/knPdtexX8qTvyevs=;
        b=ZvZ0IdbwebjG7++2HOP0IHQMz4AaqMmMKu2BYO2xMOpWlXehH/+68elnuFYBPgqpgL
         9V0i5inru6UUww1feL4u0JkKlmDCdoIAfXKMkyWW1kkPFfKc3uPcnhPMUxlBZJeUaOgB
         E6cV+iygE3I9or5/f05lqsTZPkB3RIcqk6WUJwkfA/06M3DTJHmZ206nGlricxDaj9s0
         +7CoKtCIeCC48G+v6HauJz45Rn7zQrqFk3F081Y8Jd1EuNGyCbmmp7rURjLE9v086Bb0
         jW49ILQay8xv0rZl4fRmoaaUNicB1MTPEAP35O05wmBsedh6fO0oWN/UOm5D7w6YvBRY
         cN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=3/UP3x6qrBkioKmmxeXrh4pZXQ/knPdtexX8qTvyevs=;
        b=Hj6j49pqFOLUuhOyRlNRkIP+sKXgFG45FY+zL3l9IsWrcSba4prY3+tNa+vLIzLysD
         zVAvaRcSACio8wtntcwRZlC9pbeiuUyFMTObbvg8XfGfwLmbjSz0LOfQE5AXGjZ6hMsH
         LPGb+Fg7X4FM3ggJS69BdGiEayGe5M+jDPwQ4srWnsrs1miD65eZXi0inR416HowqOLh
         gdsaOViXkdTBwRz+ufvqA4vqufWH0lySnxJXXFbLIhPrAL1FBQrRGb6fyeIg1OCvcg7S
         orcOQkt8AEhrhRrvBrhX/1WfOanaOGI65Q0oMy/x4485betp4aTfYcbi0dO1m6MEmFkI
         fZOw==
X-Gm-Message-State: ACgBeo11rHnOJ1IYtLdYQhCUdyx6lvZC5wuNkKNaK3gLgLIYP8BWV5P8
	htJsMsiPJCuPNBBnGnlH4mbwHLOXhP3prhpw
X-Google-Smtp-Source: 
 AA6agR7Fw0s4ns4+epciWlAbqbNokrJbJb8MPwClgBFvn1e7ZZG47Gd3JJ2s1StHBs3/pvj6e8dYdQ==
X-Received: by 2002:a05:622a:1115:b0:344:5d08:ff1d with SMTP id
 e21-20020a05622a111500b003445d08ff1dmr14052397qty.23.1660765837789;
        Wed, 17 Aug 2022 12:50:37 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 f23-20020ac84717000000b00342e86b3bdasm12639390qtp.12.2022.08.17.12.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 12:50:37 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"vishnu.banavath@arm.com" <vishnu.banavath@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] N1SDP: Bump TF-A version, add optee support
Date: Wed, 17 Aug 2022 14:37:37 -0400
Message-Id: <166076145747.2488249.17081147657458829514.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220816131933.33160-1-vishnu.banavath@arm.com>
References: <20220816131933.33160-1-vishnu.banavath@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Aug 2022 19:50:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3702

On Tue, 16 Aug 2022 14:19:31 +0100, vishnu.banavath@arm.com wrote:
> These changes are to bump TF-A version for N1SDP and also
> to add optee-os support for N1SDP platform.
> 
> Vishnu Banavath (2):
>   arm-bsp/trusted-firmware-a: Bump TF-A version for N1SDP
>   arm-bsp/optee: add optee-os support for N1SDP target
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/trusted-firmware-a: Bump TF-A version for N1SDP
      commit: 1badf7877fdcd7d7632f8ddbbde0c726ef501625
[2/2] arm-bsp/optee: add optee-os support for N1SDP target
      commit: 5496260af77a18c26174b99be39986f605d9f615

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

