Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2CDC433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 20:30:22 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web08.1589.1652905814495174479
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 13:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=DkHFRPED;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id a76so2461828qkg.12
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 13:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KL2jWhFdic1qqWJFFW9rTUS4S60AHUYVuUKqzQ/jwAo=;
        b=DkHFRPEDouzwD31IVA/m7dlax+W+KweX76M32mmem4o+wfiChJ3CKCJFAI0sS2FtR3
         pKgs3K7hsViPLEDdA9O+HlVfdrUaVPi8yquFcAgJZmIYLu/8C016NQlVEL3xTrjgWYiX
         wlqz+P7AKKjoda3AVu0xp3eKgNhRimthMrSIUQdxn3Y2eL9KAYM2y//ZmkzRmDLWM1Jl
         c+/jcMrovPEHF7z5vrpmBe6SOwzdgVGOGn06IJofg4nupt5S3934WWiWaR/jHe41Xyyf
         o1bvqokTQYJN+ySMp1jhudvHHymJunOfBp1k7U41XU20ivB/ccVXfnzqiqoMxSQ+GPVB
         yJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KL2jWhFdic1qqWJFFW9rTUS4S60AHUYVuUKqzQ/jwAo=;
        b=is4EkJ2sK+QX0l7p1KK9ANLLwsX7FZnaOAiEpFv04SD/TpI7P55JUU2jtdVjE+jlXJ
         C5UnBOTVH9yVkWvUlPhNIGmKZGB2P9ioCT3pKwSRheB0BrXdq0lxIuuj1mzqgcSr/NUH
         DzFkxAXcg4QXf4JuVY4/wWGTiRYE1z+X/vq6SS+c1dMfrpvAnURW2kHQFuax3omsRF6b
         9TLu/L+DqbKjw0muggJDyLH1wV9C85zhZ8rV1WmaZ0BB2afDZNmVlWCat+Gn75A18OAN
         +MBl9jZhmu98o+hYHzgn4icy58SyTsITpBIusda7Mx2/I2clcwh/3ReEmWOgLevS/wsf
         8IoA==
X-Gm-Message-State: AOAM531YucxBoNjDP4VSyW4E0+r4OSeNE/1Jtrv0Bphjvh0baC0eXzrl
	iqqu+OKz0Q7InjB0rKwUm8sjBNN+TCsLOPQN
X-Google-Smtp-Source: 
 ABdhPJyi463CXhAob7huW7vJCPfpcTHygkd3Z3YCcezASTlurCOW13THNj3yUlEAZei+a594ffNwwA==
X-Received: by 2002:a05:620a:205e:b0:6a0:5e23:7c93 with SMTP id
 d30-20020a05620a205e00b006a05e237c93mr901201qka.721.1652905813591;
        Wed, 18 May 2022 13:30:13 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 y1-20020a379601000000b006a323e60e29sm96240qkd.135.2022.05.18.13.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 13:30:13 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH][kirkstone] CI: use external-arm-toolchain 10.3
Date: Wed, 18 May 2022 16:29:56 -0400
Message-Id: <165290579643.1529019.8374824005595895313.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518112659.3471891-1-ross.burton@arm.com>
References: <20220518112659.3471891-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 20:30:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3442

On Wed, 18 May 2022 12:26:59 +0100, Ross Burton wrote:
> The 11.2 release of the Arm GCC uses Broadwell-onwards instructions, but
> our CI (and many other users) have pre-Broadwell hardware.
> 
> Until 11.3 is released which fixes this, go back to using 10.3 for our CI.

Applied, thanks!

[1/1] CI: use external-arm-toolchain 10.3
      commit: fc09cc0e8db287600625e64905170a6de24f2686

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

