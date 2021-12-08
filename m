Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF859C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 00:13:37 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web09.5550.1638922415667213898
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Dec 2021 16:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=3kSs4hA9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id gu12so900736qvb.6
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Dec 2021 16:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=e1nq5kB2zLArkz8dytQ+4HnfJF3EE5qJawItlF+8/n0=;
        b=3kSs4hA9slFEvFnChAeEcXFmIo4McYn7W4/Z6UUEU4y4mqxsEJIUq993S3nRrv8k6X
         6HPTlnUgddNW7W3qEoZ/f+XuIwYpyekjD0HQQ0VuVHujBsbHquEF5LhvgedyqXqwiN+K
         BTIYDHWnWqKnnkB1vm5UHzJsYOBFq9AhkvE2pM/i1CGZCDbjrjOi1ieBpa9zk6LoBqXm
         HWLT9sl4zTflrL3dA1ePuZ6gCfdg6In8LiJFRUg6c/9WhCfxgD8nuMk/fzx8G0JqcGe1
         xlSqVSmIcZdl6+m52LbmGAHJXsWEczUbXWTiqGHQ7rPfGl1UBUsIfK4n8Q3S6Wv9855E
         aTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e1nq5kB2zLArkz8dytQ+4HnfJF3EE5qJawItlF+8/n0=;
        b=BLunpp7oJ1OO/YCGpXz9y2qCMHbuCyCq3H3kUN7o5GPRZ8wFM9hSEvvDjvmNyXMi9K
         SHpigh8QOsq0ifXhPEKa4E67XbpBfPiUl0ALMWd9PTCCCCrg1vDYOkuXnQTwZmArnd32
         KYZYYbM+JDtJJBmnhTcu9HWPjmkWJutnCICG7c7AzEh2aOQ02RndKi5td1h7cINx6Hl5
         eGCXG5oOWudbiBpa2k0S6l6oY0kGpPv74h2v8X4UBUTHlezxDa3ck0FD2LQMtx032HB+
         rXukqKbb/wRuSTB30qUbJkJC7QI1ELqySnRR9nUDJQ+14RJ82Y1KCaxWw1GgoDmVSYf8
         X69Q==
X-Gm-Message-State: AOAM532B51rB57lQCJ4HTP1y9fVJDghMJyayCzE2P34IxyVUur11uOq5
	eQckUD+Trk79vtGfPRIStPvUf02vqUeq+A==
X-Google-Smtp-Source: 
 ABdhPJxPhmIHxG82zAHbR+pe5llIdCxHMLxp+T0X5ntjhL3RagsbdziYU/hCkOpnnMZxD7/wzqb2pw==
X-Received: by 2002:a05:6214:d0e:: with SMTP id
 14mr3383687qvh.10.1638922414668;
        Tue, 07 Dec 2021 16:13:34 -0800 (PST)
Received: from localhost ([2605:a601:a626:6000:4d65:9be:8b75:b9b1])
        by smtp.gmail.com with ESMTPSA id
 q185sm590532qke.64.2021.12.07.16.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 16:13:34 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/5] trusted-firmware-a: don't use
 virtual/trusted-firmware-a
Date: Tue,  7 Dec 2021 19:12:28 -0500
Message-Id: <163892234827.20063.10262290504157722326.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207181956.900131-1-ross.burton@arm.com>
References: <20211207181956.900131-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Dec 2021 00:13:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2560

On Tue, 7 Dec 2021 18:19:52 +0000, Ross Burton wrote:
> There's no need to use virtual/trusted-firmware-a, as there's only one
> provider of trusted-firmware-a: trusted-firmware-a.
> 
> 

Applied, thanks!

[1/5] trusted-firmware-a: don't use virtual/trusted-firmware-a
      commit: 0813344225674eb9c1e86175598a3f4142250c88
[2/5] arm/trusted-firmware-a: move SRCREV_FORMAT to common include
      commit: 8fb3c6c64505e649ad2e7810cff77fc6b71c0f88
[3/5] arm-bsp/trusted-firmware-a: explicitly set the full PV for corstone1000
      commit: 377f6a08cfbfc05033e1b4029675337e43624859
[4/5] arm/trusted-firmware-a: add new recipe for 2.6
      commit: 16f86aa00dc8b589ec47d08e89ed273727bb7f1d
[5/5] arm-bsp/trusted-firmware-a: move most BSPs to TF-A 2.6
      commit: 17d1be7b4a741ffa217e5edd514bc6b005bc95ac

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

