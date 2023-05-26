Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B2BC77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 21:15:01 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.4960.1685135700521568988
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 May 2023 14:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=fSlqbxE0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-3f6bafd4782so6165221cf.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 26 May 2023 14:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1685135699; x=1687727699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VTYrOiSby3qOyM7I4/X8ZB6iImZ6gbqExXfEkwtJXq4=;
        b=fSlqbxE0LF0rcND/7dC8+EifkQ3GgHPI0hd3OjhzHM1eNOMnDiR4qfRVNm/B8i3k8m
         /Jc+1ZoKGe9hUsFuKiNG3KltwxLKNrA9C2ipMUq+vEqRSi8D+fY0/hAIoF7YvlJxtsce
         6BzVgcArMZMeMjIBh5Fcvh6hRufuuJHvAUUKPDL58vUr91W2JmobR3SZyjZVClxEOPlQ
         UBxj9nq4E5FDLExhiy4TiANdac+4H4kwSyhIRnvqTEbRcGldgkwp1ab3JqO4Wg4guTwW
         xUB2QS8ddHvpHmBkmHAQnUCM16+tzAv8OYfMDVuCqMY4b12pT3nmGi6Twq5ccpEOU5+u
         GVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685135699; x=1687727699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTYrOiSby3qOyM7I4/X8ZB6iImZ6gbqExXfEkwtJXq4=;
        b=YZ5HPVrMvUUnmqme5yduBYjmt5sUzpdE6y7sWwet9IVSxBjJco/7s4fp9opZT0mcn7
         cmjiRO8zWAalSMLMgc0S5eMtCPrOgAqTri5O8VNOASgOUevcy/ZRvhnviap4KFvyU8ey
         K+tRXy+4r8tG0w8A+g1wnmDc2/kg5MbU/Pb3FtPpQruLNX/c2bhMtr8AbtuvD6cNm0mK
         Y5mtJ/Q92q6dqdNBh2VUqz737zxeTj34Tf0bX+yDQB9Z84iTf48HlAtlqf1KCSPHZHww
         /EGe6w7XX3DcqKVSWG/iVfa199gnGmxa+NlIms8Yh7dBcngSECzfTanDH85C25F8fnfB
         YIoA==
X-Gm-Message-State: AC+VfDx0inpPNHiDqWcdqtfhJ3fSqvtmf4SfAme1tenTOnCcapb73U/k
	bl3mYHDKeCEdSEyc2+4aSXZubXvXukGNDjI7jG8=
X-Google-Smtp-Source: ACHHUZ6qJ4qCcQS06igsvIW2V+flN6E7aG62+YnNsFLQZkrOWWkOipJn4R0Srm2pA0maNd1O7EXbPQ==
X-Received: by 2002:a05:622a:1baa:b0:3ef:59e2:b9b5 with SMTP id bp42-20020a05622a1baa00b003ef59e2b9b5mr2447362qtb.47.1685135699092;
        Fri, 26 May 2023 14:14:59 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id ch6-20020a05622a40c600b003f5352907a5sm1549978qtb.88.2023.05.26.14.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 14:14:58 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/5] CI: move FVP license auto-accept to fvp.yml
Date: Fri, 26 May 2023 17:14:32 -0400
Message-Id: <168513567944.1848813.12365603695045524738.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525200602.3277592-1-jon.mason@arm.com>
References: <20230525200602.3277592-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 May 2023 21:15:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4712

On Thu, 25 May 2023 15:05:58 -0500, Jon Mason wrote:
> It is only necessary to accept the FVP usage license when using FVPs.
> So, move that to the fvp.yml file from the base.yml file to make things
> a little cleaner.

Applied, thanks!

[1/5] CI: move FVP license auto-accept to fvp.yml
      commit: 0442164a3007d05b0d79a72251d089c8c541d1bb
[2/5] CI/corstone: remove debug-tweaks usage
      commit: ab01e64bb3f4ccb9d0a1e542e2bab5e621d9aac7
[3/5] arm/qemuarm-secureboot: add musl testing
      commit: 93cc222bf656bd59ce2e803a5b1367f68f57176c
[4/5] arm/linux-yocto: remove 5.15 bbappend
      commit: f0c11d46aa042d1a3adce2f46e18dbcd24c29d32
[5/5] Revert "arm-bsp/tc1: re-enable signed kernel image"
      commit: c6e2ebc670faae21dfd3f39893c5d5204f9457d6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

