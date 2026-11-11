Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10540.1794407041732570164
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 06:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20260707.gappssmtp.com header.s=20260707 header.b=GyUXMaC6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f269e335eso382967885a.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 11 Nov 2026 06:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20260707.gappssmtp.com; s=20260707; t=1794407040; x=1795011840; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qsxof/2jC510ia9kEDmTkBu42RXTewDsme8kQf5I7Kg=;
        b=GyUXMaC60TLLzkJXFcvqYt2ejqimHL7MsTw/Ekdw1h2IC2X+plYd45H1PCthIJF/Zr
         0/8eg4T8nRs9YUDTmRq75QkEGxYoMa7cgFbdT028lLOWEQGLGJJ+UZwNSCGPW5UIfPm9
         6qrnl6BQoAcL6zMMW+5ea2ummXeODpsyZdhg0bz0LrgdMAPQb4bF+RCPqZb0KSa6VqAi
         AytzVZUX9yKUPmo3Rfq+J8fchNYwdBbOGHzRA3U7rKOUzJ3vv5C623/97icEV/CoDUQf
         EF96vk74XREEQuIsgyACZwo2ubQeHKBeNL4C5T6D2Mdv2GOThpyjCIWRuW6dcUA0Whb4
         gNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407040; x=1795011840;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qsxof/2jC510ia9kEDmTkBu42RXTewDsme8kQf5I7Kg=;
        b=qkfbjs2FoUP/t/FjLfu9+K1nWp8ad+qZN+25SrigFtOvJ/x4mOK5MvB4AbKkWD6ruk
         p2+ZkeDJtkiiXibJ1s6MweCNwNSdXulD5tbjsDoBw53fM8CdT1Pn40RYm3u0Jxs03Frq
         Sgi+46vSLY3i4RmnYE/q5rayDUr8Y3Q3hJB6ZJERu8bA9fhQf6+EVhUQ57SHUhzAsBBE
         fEcRrh1lv6tFLXq3S4B4bL4vHI75hiCxcY3aU9O1/ztm8RjuINec+YwuYYoGbVAeu2ct
         pleuC9RQwMGIBXTpIlecUC/q/2QBxLSF/8yBsu1lK2WIv8DKmWBnmiKFxrHuUWabbXZ4
         DfKQ==
X-Gm-Message-State: APuU4Z+YXlJQIrp3+EBc6k2RRPrLm4KcAFhQM0NFHzwUC+47DOKoHu/P
	estYMckovPZiPkuEsXu+6sYmcD/qEegfCa+oEsDnIG+XjkhMDJKlEWSoehw2a80h/O2TK9DP215
	aQbo=
X-Gm-Gg: AYBFou26vWd2In2My7I5+y1h42JiDq4zjWnJzcmM8Qz/mn9Y14bCcwIFWhSGqRlc3AH
	ZDU6Yojn3KZdcgToQj64DNhEN5M2jzA1v/9tIrY4Hf1Ef38i8bAh83alIEEYEu0//jHq5umKca1
	5N2Ugs16IP1MvTji3gKmqVIUThybFwi77mkbe/9+EFFvv69xf/wWDdWF2xHVeAoCXBB9YXik24A
	ehLnXLFAPEv4pX5jWFU14d8Fu4nKyWFhbBaRmw1JHfteChjtNrgycqobRRHBSGWZU/3lOLhvVJ9
	j0UFbKUXqXWnQRjFj4wO+RzsYLeUfAirscrJKyYtPktVfNIlchXQf4ob3c0Afox50x3LTeKdjBk
	yhfygZ1tDlug207AYnhNOcqoTHNUOeJ+mxiICy5HN+mBwopZSLEhpz3zfEKXbr+TK5nLG88FkvT
	TVmd7sieNpLWZ8pFp3ZVngLVE7kUPnKhDYM0DmXrzsYKjF+Tark0fy0dW3pmPnnf99XFAo2zd4k
	P+CFeftKLk2DgeBZv5kQM+8Qoc3WTh6Hh5B9Glzn5SVG+wHbt7r5v/AjbQb8YmM2AvmJNWSh3UJ
	ljxRDNOq4wx8+jjqUMY=
X-Received: by 2002:a05:620a:710c:b0:93f:3bb5:5452 with SMTP id af79cd13be357-947aff978c9mr413742485a.15.1794407040577;
        Wed, 11 Nov 2026 06:24:00 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e76b1c3sm495697885a.16.2026.11.11.06.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:24:00 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: build TF-RMM in a dedicated qemuarm64 job
Date: Wed, 11 Nov 2026 09:22:40 -0500
Message-Id: <179440696040.2629391.5700011788930102607.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261104145505.12441-1-jon.mason@arm.com>
References: <20261104145505.12441-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Wed, 11 Nov 2026 14:24:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7209


On Wed, 04 Nov 2026 09:55:05 -0500, Jon Mason wrote:
> The poky-tiny fragment overrides the qemuarm64 target list, so RMM
> is not built by the existing matrix jobs. Move RMM into a separate kas
> fragment and add a matrix entry that selects it explicitly.
> 
> 

Applied, thanks!

[1/1] CI: build TF-RMM in a dedicated qemuarm64 job
      commit: 854b732c4a09a7c004a962ebb94da520a510e8b9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>
