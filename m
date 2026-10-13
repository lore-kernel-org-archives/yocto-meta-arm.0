Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5BACA9ED2
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 13:07:33 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6655.1791896846994982280
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Oct 2026 06:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=GaO+LC6T;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93c5b7f5bfaso862080285a.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 13 Oct 2026 06:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1791896846; x=1792501646; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hsyqwtgfFgLZSKIwGbu2VUbzb4rjuDNTFp8JYumFoHU=;
        b=GaO+LC6ToTjGXl65dtEF3kVj09j6heUwqa9ZKzyEizPHS8P8YMLlmU7fNh3Gs3YR1H
         8br05+qidiPA0tqlUsd3A/mblfPBUfKTeIISPrf2XgWjhNkCd+F89NdN/3mYBtNHdQFJ
         2QdVQnWpXn/FPmV798sq9iffnOu9dZR3bXU6bOIRW3CiuEPARqElGgDvvKjk+vCtHbtx
         0E4WCszbq/JRTfLUzOtTtjxnyVa9MvjgsACbTyd8OwfUGkH848IQ69+Xwr0uvDQH5cwP
         3Ppf3QF3ZiAWerANKGGRiZCRvp8wElVk2swM7k+QS/Fc3PV1nVXfF03oXTflKMu/7QVe
         MC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896846; x=1792501646;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsyqwtgfFgLZSKIwGbu2VUbzb4rjuDNTFp8JYumFoHU=;
        b=PpEDJvD73OsLcVvkb7VKaKfd4jBRHWn8z+ov44Z3kyCI8fNweavpud89AM9tlTChgj
         xyPxeYIvzmhsOOd8Tx2+LABTSpfndPUownBkktO1u19yyHmhbXQiopGFAuPhNy3RZWbi
         BpTd2bg+QsZZGjd5ZG6rdoJ2Mmoxlz7jlWg9vn2PmUFHcnNePQ8BbGyzZ6FYPI5Vmdc/
         DoJyjs7UWcVt+SQLb1SVb7dkkIcAr9600vzQTr+fgbViv2XyFkfl2SGylFDHOKm+grps
         JW87qUsA89wxuhACVz/QHJEBLZDBG1wqKTfFgdJ8u16M62RAchnQ9lq0RaWjowvXzkXc
         bIeg==
X-Gm-Message-State: AFq9FYI6bYI8YLHOktbj3Q03RdnEMWd/q5Dx8BHwb2k7ToIznUxwHuRl
	GztTU7vYPS/fh+fcKHP9S9JmgPn5pF5SokFS9op7vk+7m+M696RLSjNCkj5uJDwsEHXviXrCT8G
	8ZOhpvQ==
X-Gm-Gg: AYBFou1WVQCG083OkwUYwRphxZfO+WMhs4jdMikKclMDmbwIovV5iJGYNFLtHeN2gRU
	srWcs4hF5syHbZi7vOC+Odx5YqBRu+uee9OrXBoO6/g35CcFdFADkTA31LohIJyhWY4IkOcMkiT
	jdIF4uIPQalHYL0e4zcef3WvwseElIdVC1JKr8lnrAqjCsk1GDiUee90dTm+y5dt9fBsQffm8vb
	byHmFskdzM0g+Mj6o9xn0gmOf5fMv6A2gpa3m269jO2PIpgnUTfzuDVg+KDEasDXL4KkWa8Ei31
	pY6JoZ0D+yr+gnDG8i/nLyw8n+83YPz6H3XQwWwccAQQ3XqiyxGV6waujjcGwzchwau34rrQYGh
	RRIKIe3J7PpueW5U9S0eMeVc0NDjr0yCK03Vl6AFioBK6YfLFRtaPsbsFX/dOx94tQYJE44GKyB
	bao4KOFwtsqJAq7g8CsdovyaN0w83ikdr8nnwpvp4OdcjSrx5QKartULnZHNAa
X-Received: by 2002:a05:620a:370f:b0:93e:c173:f68e with SMTP id af79cd13be357-93ec173ff73mr1933240685a.34.1791896845757;
        Tue, 13 Oct 2026 06:07:25 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5027dd4sm234074785a.19.2026.10.13.06.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:07:25 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] CI: move meta-oe to use blacksail branch
Date: Tue, 13 Oct 2026 09:07:17 -0400
Message-Id: <179189683691.2297310.10165472851506558505.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261012132059.3801511-1-ross.burton@arm.com>
References: <20261012132059.3801511-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Oct 2026 13:07:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7188


On Mon, 12 Oct 2026 14:20:59 +0100, Ross Burton wrote:
> This now has a blacksail branch.
> 
> 

Applied, thanks!

[1/1] CI: move meta-oe to use blacksail branch
      commit: 49a410f6d26b7a3f91d0f3bbeffdc8f38bc62287

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

