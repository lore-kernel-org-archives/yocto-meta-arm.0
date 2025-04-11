Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F07C369AB
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 19:13:53 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.35031.1744398827381074466
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 12:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=t5wyDy2z;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-476ab588f32so31925171cf.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 11 Apr 2025 12:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1744398826; x=1745003626; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6ovOuol7vg2f2a0DtZbPI96c6/w6w6zoCUAI2/4TBA=;
        b=t5wyDy2z5K+YhR4XpMh5bOFaVFNl1f6HStYbfRIHZB9vMfVe8cxxHilORu5cpYhxhy
         JK4ZP6TI58PP34Tm1f/jtr2aWIj4UbO5DeO1jw5aikULZufmEJYQDxDmrhJ9DcJH+Q2j
         7rE0qRLkFaDKadNhNhKv/PPm/atAFRZLm9YVwCHBCnQUmyNLGf7LX8dLceSyCFxFgTn7
         ePy/O9tQfBrJM1MYOHg/o3D9m/lN5tZhM9K4qwOaDmT7gcR5AGnGQMoAaVFGwOnAn2Av
         Cwo/R9jzk0XVaZI3IAwtePt5l5KifT8Th4tjiP8xboKf43s4zE/V8SvIcEzCnBKQdIjG
         9eRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744398826; x=1745003626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6ovOuol7vg2f2a0DtZbPI96c6/w6w6zoCUAI2/4TBA=;
        b=LsmrMaadyDfzet6mCVV0/+TPE4VbZEtsEXU4hMth0E12Ap2PoifrV8mSdzymxJRmQF
         2l7h0Uf7/FGntxyMLOkdTdDJm8RnjzmKf7xk5yZad8vYQriPjgUW+F+OAqkKhdcFlcti
         tLZQQhqjN0yriVqgOp1Xk5LVPlyTGRuKr28uqhkofQ+NRABp1669fZ4z+RKHuxTZehHN
         5MWhIz2I8x4aTYyOPiWntoGpZ0QsL8sBcNLVxJQPe5P2nZywKfvFRBkmOJhKTeg60hr5
         anPLXXaRCX4RaARQbQ7huM3ozvDRRjF2OPNZ2A3FGxwXI0ECQz3CjFmr9jv6LyQ/1P4a
         RGKA==
X-Gm-Message-State: AOJu0Yw+Wzyml7WVQI482UjfXujbL9zpDbR8iFgncMpQ4jTjEgWlFlle
	YetZ1gIrUo488qqayxYq83jjBnP8LghU7czoaA1eTvsgikHf9XMu+Bx7d9BndFM846jJ3lmFNsl
	E4g==
X-Gm-Gg: ASbGncsSpsBIUoPj1JnvF/teB3GdPPli0700TZpWhDIOySUJCPs+rXMThuem//tteMy
	R2tItP2sGaaf7lCNRUzj3F+lkThml7iDSJAcXdb85DMJ67A09W8/LcAPU6t50qFNBFT79Ba0Ak/
	lY/Ipr27h80b4iSwuBKfsUuPkQ0wKFFIbPtJH7RzpguBYMsupkwUhKUvdx4Kau6BvUd0RA5LN08
	6pPTLv5dHkxzkTOISZ3relDjOddZAthEZQqrPXmZfk5LLTLXe/GDMtDTgSHDPPfC3sTZ6PvpyJn
	Qw/PSURrhoz20rF6cLMCispjD/Vu4Hxg
X-Google-Smtp-Source: AGHT+IGRFnBv7eRns4NpGFTAGmsk4P/2GrKWR+hGX4MxwVlWhBuD3X0Ms8E36LZGMX5k4CB11xrGcw==
X-Received: by 2002:a05:622a:15cf:b0:478:de12:14f6 with SMTP id d75a77b69052e-4797756e945mr56415411cf.31.1744398826023;
        Fri, 11 Apr 2025 12:13:46 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb2cbf1sm29838601cf.38.2025.04.11.12.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 12:13:45 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Yogesh Wani <yogesh.wani@arm.com>
Subject: Re: [PATCH 1/1] arm-bsp/documentation: corstone1000: Fix typos in the documentation
Date: Fri, 11 Apr 2025 15:13:33 -0400
Message-Id: <174439881346.2238189.17719500298938570661.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409085736.169671-1-yogesh.wani@arm.com>
References: <20250409085736.169671-1-yogesh.wani@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Apr 2025 19:13:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6463


On Wed, 09 Apr 2025 09:57:35 +0100, Yogesh Wani wrote:
> The Corstone-1000 read the docs had some small typos in the
> Design Overview section. Commit addresses these.
> 
> Copyright information now updated.
> 
> Yogesh Wani (1):
>   arm-bsp/documentation: corstone1000: Fix typos in the documentation
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/documentation: corstone1000: Fix typos in the documentation
      commit: 385450558e839da8b6b6483abd058b660ee7a136

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

