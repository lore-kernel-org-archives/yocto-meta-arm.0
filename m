Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40A2D39017
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 20:33:47 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20321.1768422824399094398
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 12:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=WmK/9Sdb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5014e8a42aeso1972361cf.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Jan 2026 12:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1768422823; x=1769027623; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tb1IFAmoOpQE01rebC0Px0w3t/eNxgDpdVz8hWBxxv0=;
        b=WmK/9SdbalWw2dfzwlxSqoWxqm3sEsRLCYiNXdjFMWKCoyt5R8qpPipGHhnOTiTrtP
         pIewRsO2DvjnctUafY8Fe/ZiKsEHBU1pzyCo0RaE/F+hyu+lX4y4YhTYKi/6+K6oPV6u
         CZDO2tMKnIM3rYkKhF3oRHy/xViTzOnpwLF5uUuQan70OlWKZaIN/2NFyxH5bQ3JKK80
         5bDnt2qzLy8sakv8uR+3wINZgPSeYoMG6LjrKVFoxTQlnBE2IZVMEEXWPPaEU6kO/JO8
         OpipwyMm7aolU/noox+QGlamPh2C4viz7nL+rB3KIz9mONIj0lMgsqpOkByJzSmzmzqp
         +E3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422823; x=1769027623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tb1IFAmoOpQE01rebC0Px0w3t/eNxgDpdVz8hWBxxv0=;
        b=ujgfq1X7TB6dSB/lq6nmdX4qsd4PnQBrxoW9GgL4QoJWahE6fFXkEjxZMUDe7kFzFc
         9CqRP/d/MR7GDryeyyO8HMngHI+GIzGdq9C4tCEUe4mjrrAoNOxolk/uTbk7MAHO5YT7
         n04ZtREBJF0TniUVrB9I4uRh2ohrQXYzu4TMCG7h/52cbtWlzNSnoJBzrgAu8jVnmt8u
         SGpC+eZE43l7Lo5eQ0ZZDvRfJd17L89YWSAL+wxuhsQHQ9phAlmsvLfdYy/QnMVsVOyK
         paw/AYkNLOXYfkwZ1QRX0mwC0eq64oTotijQy/8ZTS5r6Gpe5IOI2eOMYCbvBlRWVX1x
         2ztg==
X-Gm-Message-State: AOJu0YzNR3bh8TGuxHu0W8eKq4LkIaqTlIoJtK9FAjIVkoj84OKJkIBB
	zWHOWwnkdPRCm4ZBvMqtdeMte9ESBuAZZa3hPnlp0kQ+fdeZswszREoCFH6RhpZJ8KjtgrCJQ+C
	ODJI=
X-Gm-Gg: AY/fxX40vD6i5UZ/F3MgBck6kbWx1PEh74i/JrFZVkHn8G1lD/48TFDU4k7U44IEpm/
	ZUDU3F/3rCgcq1vEbK5i4josxeLdsECTrePjgAdUeecHgg4jIKQby0rvhho4IwNyxENaOiVqfv8
	ZRVLkJatrws2In5pX6l2AaOrf08Mn8FseYJ1kJQCVSqebl4FajEmnJ1YS58V/XwDhXjK+xEyW1+
	oAtgNlu+pPiquWUDC8qJ+fgJK9GX7qgEEJSZCC1qCq7efr+eqE1XROGcTorGpIF4DJxq1zWPigv
	QiySSU7APpAvj4mPplYqQNMuUP6T33TqauWk5tCuAlmpwfGX7zHXuldrk2YXFyad5MYYO+Pjr7o
	G0iFQtDtZw1/cJs0J//b5ACi4RwA7BzKyNG6xONU5Y43C5vepfHGcoKTlnCSVn5hnUwQlbVYJA4
	8G
X-Received: by 2002:a05:622a:2b46:b0:4f1:e284:d42a with SMTP id d75a77b69052e-5014846a799mr53005511cf.43.1768422823106;
        Wed, 14 Jan 2026 12:33:43 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50148ee0a46sm21339951cf.32.2026.01.14.12.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:33:42 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH] docs:corstone1000: Update user guide
Date: Wed, 14 Jan 2026 15:27:59 -0500
Message-Id: <176842248234.3731607.8498921902917606350.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260108195713.35744-1-hugues.kambampiana@arm.com>
References: <20260108195713.35744-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jan 2026 20:33:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6845


On Thu, 08 Jan 2026 19:57:13 +0000, Hugues KAMBA MPIANA wrote:
> - Replace openSUSE Tumbleweed with openSUSE Leap.
> - Ensure correct component versions are listed.
> - Update changelog and release notes for C25Q4 release.
> - Add Positive partial capsule update test.
> - Improve user guide for consistency and clarity.
> 
> 
> [...]

Applied, thanks!

[1/1] docs:corstone1000: Update user guide
      commit: 9d3e85c7d8d9c56f3898ca56321aec0955daf84d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

