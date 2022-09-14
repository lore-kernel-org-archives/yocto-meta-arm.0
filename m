Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A9FECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 14:09:34 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.6860.1663164570311975969
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 07:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Nfh9YsTU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id h21so11211328qta.3
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 07:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=GarNOc/CrePQnO8OMZvgA34w8cDDvHK3eluX4FHBki0=;
        b=Nfh9YsTUmgkVWE86YM0zYlCnpaAQwluMaF6dokDwgwo/iauiKiJTjOEtB5apBI277X
         ryN9SpxJvFWJxHK7GewTzaE5ZCFiX7aQTgDpWPswRh2Zw2PUhtuQMyvwj0iCykMn+RZa
         gzrmlUtkb+NyHFY2n05lT6FmJH6CxyXxRhJpUZOzyUCicylrY+eGcPlYRBFcjM9M3ncC
         gewML9Z4WIxvJgDK/cDJ1s9+B6k/eLRzrft1pIP5l0D+Kqqa7rPIP6cUnqFeISUTqkDt
         xgie6mRBDb6a1bZgeP9aLxLHEQ7NDX2kJi6h7RZlryl6MFuOEJzGDOh6LVcMzR7rdssU
         npHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GarNOc/CrePQnO8OMZvgA34w8cDDvHK3eluX4FHBki0=;
        b=YnazgGc+OubhLTiHja1mj7DaEuHiep7jWzAk/Ycv0sjPWejeNvoR/BtO6lmMHJZgBD
         yB+fTIK717b1WsIzQIxhxGfdqwwe8eWyufzkGCgXQUSscIL86xa7oBRCK4R/m5+MkS6n
         VZsc1Cisv8WeRZPiMbfDRRw7cMhQQ8ZZNDFn99ZKL+cCWua1SVjcX06XTszVKxomPFaT
         y0JGX3pkzLObxB2OUVeOWh72FTWr9eXNHLlsx+9ObwoIaGrK0soUckbu/jE8B7GgZDyv
         GacTacNN/+TIG9ZA7syq7iGl4Kred1pO23JcneHaGZ29Etk5Mtc41nUjUEbtT4pr2f2g
         fjwA==
X-Gm-Message-State: ACgBeo2FAENSmTdFAwvtYB6GzWuVBVWZtI9tdYshKl4DDGzXC4VcHjy7
	WhDEJQ9ROGXH5Hn71VUEoNnayOqXnSWywg==
X-Google-Smtp-Source: 
 AA6agR6XPz8oSZmYK0gsbEhMyC/QPSjqMOjnU1O9WTkny8IVhV5SfCNRNEsxBptq3auFFc5bvOY6Rg==
X-Received: by 2002:ac8:5d89:0:b0:35b:b58a:2bcb with SMTP id
 d9-20020ac85d89000000b0035bb58a2bcbmr12769927qtx.273.1663164569004;
        Wed, 14 Sep 2022 07:09:29 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 az6-20020a05620a170600b006b919c6749esm1895967qkb.91.2022.09.14.07.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:09:28 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [PATCH] arm-toolchain/gcc,external-arm-toolchain: resolve
 conflict with gcc headers
Date: Wed, 14 Sep 2022 10:09:21 -0400
Message-Id: <166316456166.1963403.3189996269177681641.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220909200436.1728775-1-denis@denix.org>
References: <20220909200436.1728775-1-denis@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Sep 2022 14:09:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3777

On Fri, 9 Sep 2022 20:04:36 +0000, Denys Dmytriyenko wrote:
> Historically external-arm-toolchain recipe packaged all gcc headers from
> ${libdir}/gcc/${TARGET_SYS}/${BINV}/include - some would be picked up by
> packages like gcc-sanitizers, libssp-dev. libquadmath-dev or libgomp-dev.
> The rest would fall into catch-all libgcc-dev package.
> 
> Unfortunately, that could result in a conflict with a target gcc, which
> also packages some of those files, like unwind.h or stddef.h, among others.
> 
> [...]

Applied, thanks!

[1/1] arm-toolchain/gcc,external-arm-toolchain: resolve conflict with gcc headers
      commit: af69667215440b6bc6a8424c213dee1175ca6198

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

