Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22A1C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 16:16:33 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.606.1669220183865118152
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 08:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=e3BKlIkw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id w4so11562529qts.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 23 Nov 2022 08:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMtU0SdimWEpfcAGCpS39Bp+RI2c5i/7qAiK49bF0go=;
        b=e3BKlIkwniXtJsoqOforB4ZIWlSl6SaK4jh7vhurfWLTZlN1ej1k2z1VEVrarvhiVa
         jF5Vjow0lDKIaJtP7UaMQXmmoa/Zu2tj/2rdnUO6MeOCFNEpZnXLplBH4dWpcfLKIXr8
         AacKXK84NbjLaKxsruBBpDXaslz+nOPqsNd9rPlBKwit+rNPE3m92WyNHDD+9amft2+d
         yh3u1Y+BEG4ceNU/0KAaZOv13yUAoly5ivf0gylEWJgxUTxqgvI/IjbSqpxecFnxkdki
         ZZ29hEzdUICWPiHIyojB6s1TTCFApPFYHqmpFCnF+yNC37cNzW71VnAEEONas261p9dz
         HuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMtU0SdimWEpfcAGCpS39Bp+RI2c5i/7qAiK49bF0go=;
        b=HGQ7kedg8i3wmzBm8kQrAi/9u8cn4bCfKvKvWp3Sz8vr3AywHo6mJkwLCzD++Xq4Am
         BykEltzz53DzGi6RSw/gASpuYFQehPnfuq2oy/iFy+bGAG3CGSX2NazOXHMtGoCPGnoP
         Hf4q56ckFt+EJMkIgyVsoJ3uS9jJVNiDryV6crqs1JBnPgNnk/Tqo/jH7aL9loDPCd21
         82kTjyMH0gMYtk5xWtEaHg6cvMvU1tkzCdVBu0TV1knOzYbdP3kA5j1RQ0BiwothhIvk
         DwbE/YvBjFlQFkaxkAG6vEMR56zja74zPQqZsZ8VWvWQs8YavhinKITRUyTzkFyRVKXd
         dKMw==
X-Gm-Message-State: ANoB5pkkb55Lb4VvyiCynQ1j+XLs2NECivngk3dplQCsA61pK6qCoUgO
	ZWGRNBHt7yhr62ruxMYoEWiNuWfrHZHIsw==
X-Google-Smtp-Source: AA0mqf43g66CFDFPGsXm/Ju3HckGlr8P5Mgq1fVrgUtlLKP/oKfIPSSf1/d3o4zA3hgDorhVZiTyHg==
X-Received: by 2002:ac8:4e23:0:b0:3a5:8b7f:a8df with SMTP id d3-20020ac84e23000000b003a58b7fa8dfmr14638383qtw.235.1669220182489;
        Wed, 23 Nov 2022 08:16:22 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id w128-20020a379486000000b006cf19068261sm11872601qkd.116.2022.11.23.08.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 08:16:21 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: Re: [PATCH langdale 0/2] arm-bsp: Corstone1000 update user guide and documentation
Date: Wed, 23 Nov 2022 11:15:09 -0500
Message-Id: <166922010934.3544691.10859224430838112233.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221123133248.558581-1-emekcan.aras@arm.com>
References: <20221123133248.558581-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Nov 2022 16:16:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4164

On Wed, 23 Nov 2022 13:32:46 +0000, emekcan.aras@arm.com wrote:
> This patchset updates the Corstone1000 documentation and upgrades the FVP to the latest release version. Backporting these patches to langdale for the upcoming release.
> 
> Emekcan (1):
>   arm/fvp: Upgrade Corstone1000 FVP
> 
> Emekcan Aras (1):
>   arm-bsp/documentation: corstone1000: update the user guide
> 
> [...]

Applied, thanks!

[1/2] arm/fvp: Upgrade Corstone1000 FVP
      commit: fb43632e7ce0bb24a0b1ce191afc4c274638673a
[2/2] arm-bsp/documentation: corstone1000: update the user guide
      commit: 1549624dbfbafe5151956feb1ccb351808a7cedd

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

