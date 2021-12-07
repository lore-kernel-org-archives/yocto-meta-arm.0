Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4253C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 11:00:16 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web09.65403.1638874815493843312
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Dec 2021 03:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=DKmgcyNK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id a2so13828625qtx.11
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Dec 2021 03:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eqHAU1LOhUKOnEM5p21D5D2KCbTHCxk08GF3KY1iJ+U=;
        b=DKmgcyNKR28cf2aYjQ0F9T+hfXMp4pFDOHvlptnXPcCGB3ogVW7WHr/ycqUyCBiOe8
         Fy5bpBfstgBUS1W7IM/bm/bXBqzKR0e/wwJMfXPqe8l7BswSkecXbQDS2bcX4oVgScXs
         cNJnV1inY5EL+voYs5RqpCTp/dnmgTfrjvczR9ppsKHrKXzDtUYggKzX5msfC0mXTLSB
         o7RQHA4KDCRXlwiOo0/+cunEjnUVv3BcKCAsQl0KLIsMlhhWNfS6cRzFmIgDINm8y7vu
         sqtXB5PmP2d3RMMnJfpvg1WPuxLSfEm1cDAQ7uAoxahYzUPVX84Ev27A9WXWxf9+xnd0
         Rv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eqHAU1LOhUKOnEM5p21D5D2KCbTHCxk08GF3KY1iJ+U=;
        b=cYbE+FLNQRkZgnEjQsh4KXYxnCtq1s3cxbfdbsX0TRkW7zxf1NbesLnsY/VmPsmUV6
         762tc8RX3N1bz915dV7KNhqAknMRZCGpffMEvEOL0cg9N0FtpDBynEJdukL4TbMVqah5
         H8a4MLpDa1FyPp6a9zowr6lq9BbYpHgM5TUpWXwIyI2e7qs/1w/UnkDWAmj6RuBVJHAF
         Z+h1p9HrcfCK3MraoHYJ28Ez//avnWGzQjjAteQWSuLpf3ihp8Xet871UKR7sGYshFA3
         +2WUVTx6tYlm39+cuy2z1n8a91m4s28kQRhQDNYRTZuCMuOjkPY5hnjavIAYHqJ7gXBv
         K/pw==
X-Gm-Message-State: AOAM533LyoT6wwsJUFuxBH8EK9MhXN9QsA9jCCvszGaxEWLP8e0SElXA
	D40quhnWs1gB0SGxnM2eGSGK0G7edScHhw==
X-Google-Smtp-Source: 
 ABdhPJynhd7J4/VoaohkEaApqgY0Fy7F2RR4sq+ZLWD9Ncx2G992/an1d1Y8UzSXOxuLRCbw5BM4Vw==
X-Received: by 2002:a05:622a:1812:: with SMTP id
 t18mr46921957qtc.455.1638874814459;
        Tue, 07 Dec 2021 03:00:14 -0800 (PST)
Received: from localhost ([2605:a601:a626:6000:19fa:f48f:296d:65bd])
        by smtp.gmail.com with ESMTPSA id
 u17sm8157072qki.2.2021.12.07.03.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 03:00:14 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm/scp-firmware: upgrade to 2.9
Date: Mon,  6 Dec 2021 20:28:24 -0500
Message-Id: <163884050397.6355.13447576260992306567.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211206180312.1712721-1-ross.burton@arm.com>
References: <20211206180312.1712721-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Dec 2021 11:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2554

On Mon, 6 Dec 2021 18:03:11 +0000, Ross Burton wrote:
> Drop a patch which was backported and is now included in 2.9.
> 
> 

Applied, thanks!

[1/2] arm/scp-firmware: upgrade to 2.9
      commit: dc3fd61dbab5e52ff88a75c8d5c8fcc98060a32a
[2/2] arm-bsp/scp-firmware: update for 2.9
      commit: d16fd5e343a2c111e3175a074ede2be41b58b4ae

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

