Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD0CC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 14:41:34 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.12607.1699368088108312025
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 06:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=VbSu0w53;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-66d060aa2a4so39315496d6.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Nov 2023 06:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1699368086; x=1699972886; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9CpnB1PSDqjAAmjgoBn+Q0JPAkU+jYHsqpO/+3vPgQ=;
        b=VbSu0w53g2c2kOErC4xqLY0jDVoaQJgE6erq3YtQgxJ/9dRAtMaON0bhy5WqI4Q2Qg
         pbfFg2be8k3n+GXs3pvKTaWDH1ECEIC2RmD4lIFBJiD49N//lodJWiy1Q2aNBDGODQ47
         U0tv+30t6YG1deYutuNgJZczLRs8wxD4TUs3uUm8rJBbIeSRjqiA01XUGArTynKfAkEd
         ps7ap/9IDhDxpNSpmcvVkM7upXEz5/2yB6Uoz6dmHXjqjxNiMbPnAmXb9BGTEiCG6EdG
         uhuViCsLPqonY+Zq2VFMzvnKo5gEwgK7pcWalz4KSAKlI3n40Esl4BKGw0LHC+fOgfD3
         GbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699368086; x=1699972886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9CpnB1PSDqjAAmjgoBn+Q0JPAkU+jYHsqpO/+3vPgQ=;
        b=mErvv0m0jPyyYs5Y31eI/4yrrcvQG9w/g8Atj27ZSFAJMdgM9FnlvktLeidO9YHqXS
         1y9ypQ6G54lTdKLcEqXlcGAK9xajmjB2LxmSx12cB2Ch8vwFoxBJigmhjI0mFk2qxhtr
         16v5Y8I7UkjcdiIEcH+shqQTQF6KPhWaKzqWLPDmPKWecM8oV5kEv9GxtzeADfneDL88
         4a8/4LaprvxDpwf+T7zM/7FePcKZjbu+uDQpePd0JiDDmIHTmIblxZZSabR+Ka9PbegB
         8TOFsrtikDpQEH9ub4WP1jy0e4wxNcVVHdjbAsfW+dnrsVzf04fLg/y9t8GUWO7rJN1V
         +WmA==
X-Gm-Message-State: AOJu0YyPmkYODu7PAPhASkNLyKmTOnQGo773GBkz7Q0JKF9zHoFAz01d
	D9I9Tatb5Ea1rQD2nWaruZ/IGr2UhUqAluTJfDk=
X-Google-Smtp-Source: AGHT+IGvhz5C6YFpgbLTLl9rTpW4QI8vtahElXY1sHu3OxpIH1S4729T0Zg0g0X/QjdQURV8qja30Q==
X-Received: by 2002:a05:6214:2b97:b0:66d:9f09:b69c with SMTP id kr23-20020a0562142b9700b0066d9f09b69cmr30207717qvb.29.1699368086588;
        Tue, 07 Nov 2023 06:41:26 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id v1-20020a0cc601000000b0066d05ed3778sm4407765qvi.56.2023.11.07.06.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 06:41:26 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH] arm-bsp/documentation: corstone1000: enable debug-tweaks
Date: Tue,  7 Nov 2023 09:36:55 -0500
Message-Id: <169936781963.1895078.10861361861541047876.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231106165201.327960-1-abdellatif.elkhlifi@arm.com>
References: <20231106165201.327960-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Nov 2023 14:41:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5213


On Mon, 06 Nov 2023 16:52:01 +0000, abdellatif.elkhlifi@arm.com wrote:
> add debug.yml to the build command so the debug-tweaks image feature
> is enabled
> 
> 

Applied, thanks!

[1/1] arm-bsp/documentation: corstone1000: enable debug-tweaks
      commit: ab0ecb5901dba2eba817e05ab28ff1f14229c8f0

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

