Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17685C4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 02:07:27 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.3187.1714529238950281623
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 19:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=IXWW6cx6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78f03917484so433758685a.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 19:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714529238; x=1715134038; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVqOXfi0zYcPwATwqi9sPExG/QrS7H1+JHZ4LqidnY8=;
        b=IXWW6cx6mBuF6bt1h1H0430mvnvNwML/b3AAwx0jSZcJrNPWG474MWdB/KqrJZ6SSt
         cfqaBzfl/uVdoiIkMxsRId/RYRBgMQRboRXi6Nar4ZOUnfj4ZhD/za5A2gBbEv8Cc5rq
         vNwJHHarf4DPHo5wiHFiWWCyzV4yYY7ZOA+i2tdGy115sWINo91zpico4x7TZOOqPPQ9
         EEiRYFUDuAexwD3c2yNABw6BlDkapb6acv7JHTCYrkn4TkZgl+ToNJZI92OOn5FId/1b
         OurrMOEz+5By2xADQuF6duh3rY5rEhgJOXcluEQ54fNog8y5kDmzCcIBHzgtR7L4dupY
         7/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714529238; x=1715134038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVqOXfi0zYcPwATwqi9sPExG/QrS7H1+JHZ4LqidnY8=;
        b=Tq02TJF/hX/BfrBwQiDCOwsrclGofSFE9Ja3/Hl2P9NgVu5XC5N+lUTmQeJDgBRHMQ
         iIolqBkb0JPVypOOHaBCxH5GaViZVXo7zb6As2W+Wohm2FVUqQIkOR+TXPYaTaJjPyM4
         egPVPVYdWqDWAV1NKEM43SINZ/IDCf1MGfY7Dl9hthwHtgXpgDzUXG1HbqPA9NYgx/Gz
         Ao50hX/bo0IPnyfIIAYar7+AvLQ6oWHl8VVwlnRdOHxHpq6CEkehnRVH2xxwmJrnSo3D
         twjaSVebN+u/tMO14oJSnwJTra/pCwt9/Aw9R4Fp9YPFe88L/IV0EHJGZs3qk3u4LLJ/
         tn7Q==
X-Gm-Message-State: AOJu0Yx+AxS1taOvZ56dj7npEsab7eHnmxjb6RE82oPGyH2/RhJwSCOF
	nW/hrwSXack0ISUTcVX039wvFbs9FtxSjjpJizLx7Xsug7Mgux5g3SmQlB34kn1A2nze0E34dyE
	=
X-Google-Smtp-Source: AGHT+IEzS1BFnXv5GqMmGMh64eXqv7fAGtHJfIPglCjyrY7JWYoPdjJws4u99QaQ/mLBCruKYKMMLQ==
X-Received: by 2002:a05:620a:384a:b0:790:795b:e667 with SMTP id po10-20020a05620a384a00b00790795be667mr1014100qkn.38.1714529237798;
        Tue, 30 Apr 2024 19:07:17 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id o11-20020a05620a22cb00b007905e9c01basm10393790qki.122.2024.04.30.19.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 19:07:17 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	emekcan.aras@arm.com
Cc: Emekcan Aras <Emekcan.Aras@arm.com>
Subject: Re: [PATCH 0/6] Add support for using the systemready layer to Corstone-1000
Date: Tue, 30 Apr 2024 22:06:54 -0400
Message-Id: <171452921870.3441774.1381238881671422847.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240430162957.94499-1-emekcan.aras@arm.com>
References: <20240430162957.94499-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 May 2024 02:07:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5675


On Tue, 30 Apr 2024 17:29:51 +0100, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <Emekcan.Aras@arm.com>
> 
> Adds support for using the systemready layer and create ESP partition for
> corstone1000.
> 
> Drew Reed (6):
>   arm-systemready: Fix regex in arm-systemready-ir-acs recipe
>   arm: Handle nodistro in firmware deployment
>   arm-bsp: corstone1000: Configure Corstone-1000 to use the
>     meta-arm-systemready layer
>   arm-bsp: corstone1000: Make ESP partition available to Corstone-1000
>   arm-bsp/corstone1000: Update Corstone-1000 user guide
>   ci: Add Corstone-1000 to the SystemReady ACS build
> 
> [...]

Applied, thanks!

[1/6] arm-systemready: Fix regex in arm-systemready-ir-acs recipe
      commit: 97e0c91f79ca4e5e017ee1607f2938e69d43cc7d
[2/6] arm: Handle nodistro in firmware deployment
      commit: 67f9756fa08a50aa4b7a62e6b1674f02199c89e3
[3/6] arm-bsp: corstone1000: Configure Corstone-1000 to use the meta-arm-systemready layer
      commit: 1fd614e545b45719d5a1886629884ead9e597b5a
[4/6] arm-bsp: corstone1000: Make ESP partition available to Corstone-1000
      commit: eed6bc24d129a0ca97fa1f44f5cbc781ea7c9a43
[5/6] arm-bsp/corstone1000: Update Corstone-1000 user guide
      commit: 3b97565103e544f6b67352da0d3908a320f378e3
[6/6] ci: Add Corstone-1000 to the SystemReady ACS build
      commit: 0e3fc3d87b3bc3252f926de47a2bacaafff1680e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

