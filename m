Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4A1C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 04:51:44 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.7516.1699419100838069874
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 20:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=hvNzLg85;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6707401e1edso39787166d6.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Nov 2023 20:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1699419099; x=1700023899; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQooT0Ys8P96frRaujSwwor+UI0JeDlwx42DCXjYkCw=;
        b=hvNzLg85J7gilvgY3N2Z4tg9vkpgHDTglDSkxLzYZO59xikcCfHRDVLi3rpcppb+OV
         nANh8egngaKglOrAJpm5OYoelV57VwWB2MYqRPy/8BSMhw/oSTHYF8wAsOGsQYMUVVhw
         vx2umQDvzSM7k7z57NqHviptvNVQkIgEPnpHTzbUWhpClImZDrEYw3QFXl8HyYVEdJrB
         A3L6kCz3YNMP/ut+65NKloi+71D4vJgCtIG96IDqilD8YfBBd3/hM/PuL4KkVyYthtS/
         DpoSF6POU6h0W0qIGOTT9ktArnRaOvSRCH9mIA3345/YnvzTK01K59k1HGKKDaAfD0oX
         +i3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699419099; x=1700023899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQooT0Ys8P96frRaujSwwor+UI0JeDlwx42DCXjYkCw=;
        b=SpfqBnEcMOBKoHWGFwLZGALZSVegWVp+dWEcoX3SaGtAJIJy491PTlXzXTIinL+DCP
         uSforQdSPSXXZM86gaZ079Zz/GsHKJ6Ymsnt+qebq5LPf6jbvlICGPsJmm9UU8Csjaxp
         PCkgQXc2SS12/NpwpRGUXEMySIArAw5kYsQkquIfK9bC0Y4dng+3MsfO9J9einl1r/pY
         DZ4UdXMzClQcAgDt373XcYnETIpeKTe4AtwVW/8FZXxxINeTx1YxNdsZR6kmd3aGBYtT
         LFd54ZIe2/Qlzu4uXJjx2bLHOjtEIqiT0nQEEkEEOVX7drf2OdKJ30HsBPq1DpAI9D9B
         0Kmw==
X-Gm-Message-State: AOJu0YyB5j94DzNgkUm84QxsHRlko11dfxbg7FtxexHEaSMrRvT7+JFa
	RMfZ6FyDfmQl6CXrERhGDv1wz45PKaldIDXvOTg=
X-Google-Smtp-Source: AGHT+IGaif0fPkePkUtWJG7h9q5+Ozt5RJ3FLmTWvzNBn9YpVkVz9ORKVwyKZRKvI3yZ+nx63WjoOA==
X-Received: by 2002:a05:6214:1d2f:b0:66d:bc21:814c with SMTP id f15-20020a0562141d2f00b0066dbc21814cmr963010qvd.65.1699419098929;
        Tue, 07 Nov 2023 20:51:38 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id qb1-20020ad44701000000b0065d03eae7a0sm668255qvb.82.2023.11.07.20.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 20:51:38 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] arm/lib/fvp/runner: don't pass '' as cwd
Date: Tue,  7 Nov 2023 23:50:39 -0500
Message-Id: <169941904138.3102675.8087945557996622615.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231106155914.2552807-1-ross.burton@arm.com>
References: <20231106155914.2552807-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Nov 2023 04:51:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5217


On Mon, 06 Nov 2023 15:59:12 +0000, ross.burton@arm.com wrote:
> Don't pass "" as the cwd as that fails, use None so the cwd doesn't get
> changed.
> 
> 

Applied, thanks!

[1/3] arm/lib/fvp/runner: don't pass '' as cwd
      commit: 98e85b3a297dcf0c953ccfc29b539d3517dfc09b
[2/3] scripts/runfvp: exit code should be the FVP exit code
      commit: 6fa5992471941b7cd55396b3a454ae85b9c4253a
[3/3] arm/selftest: add test that DISPLAY is forwarded into the runfvp child
      commit: f923386a0dd5973ca28cca3127974c8eaf5e04c9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

