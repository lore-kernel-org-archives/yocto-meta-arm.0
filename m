Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3B4C47DA2
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 15:02:55 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.16908.1705417374190534880
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Jan 2024 07:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=c82qzpdM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78324e302d4so696883385a.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 Jan 2024 07:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1705417372; x=1706022172; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SnLOxXAyAI9Ejer56wjo69YFHBgHYjfS95J693RlGVQ=;
        b=c82qzpdMZM9KTpupEcbva9y8Kq0gn+g45uWX7p4N/EyHJEDW6gPuM6q5YZeniggGQt
         1TjqQVs9Vjmo1NiXVemUp0MfDKhsEmCT/r+9aPKWbv7QnGIIWSMnaKEEaOECfVfUPldD
         carmckiXgXbFGmDbkIora6PM1rM+ffwV2uOLvN/Y2gY6PVxXgMOX+XqAF/4Q2GZxhJUn
         uE+m6S/9TBEmHx4zgbWxftC10sKGpvXviHXn0idpFK5tj/pMiTL2ATJXbc9CObC1vLUI
         YTzQKSaDn/WBSZQ9PKVPWifV3WUWnK8GBLQt1G5/owskoLP7iUg+bVmZtL4gj2mnR1Gq
         /x8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705417372; x=1706022172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnLOxXAyAI9Ejer56wjo69YFHBgHYjfS95J693RlGVQ=;
        b=AIaF9xbpOE2wN6eCVeEAP4zrHwWglvRwTqL47uN7QNP7BsZooDbc4sszZIDAmCkA2D
         OV4+z2ag+ec0Hr6WLIZ0C5TgDAB8YLzTKFw1MNnuO6HRy0MmYqZnwD7cvl8Hi+Rsqpzy
         dOxc9cT5/u6ryjIJGhi57++OYe4vv5OSM5cUN5k43mTothQBskmFW5Z/tYcpXiO/l9y7
         9UCKmERTqn4PUVSMLtTlpgktrJe35qfN5wXK1OyaZQDG7d+wbUYB2RGwJinTdigzz5Fa
         7Ao1RPWJGb4PNf0JhEqEl8jfzM2ZtaCAKGZahj689aDsFzjqh6NMVOjv8LRJrlzuYwTR
         LCbg==
X-Gm-Message-State: AOJu0YzKJHBMH4Kx7QP1UpTNRlukbQwrpY9qgFzO5aVBpkNOFfOoAc9g
	pzxuNfDPqK1gyAApYmBrit9TrrNQx+y5L2YMdje5Er1epg==
X-Google-Smtp-Source: AGHT+IHmgykPEHkuiY8txZBxtk3OItMX/wfwQ8nkOVNq8dWGIl7SPXK6jITo99z7PMPWcC4/q/mHug==
X-Received: by 2002:a05:620a:14a7:b0:783:577c:f1a2 with SMTP id x7-20020a05620a14a700b00783577cf1a2mr4618124qkj.19.1705417372248;
        Tue, 16 Jan 2024 07:02:52 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id p24-20020a05620a113800b00783183a9b03sm3719839qkk.134.2024.01.16.07.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 07:02:51 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Subject: Re: [PATCH] arm-bsp/documentation: upgrade Sphinx slightly
Date: Tue, 16 Jan 2024 09:54:16 -0500
Message-Id: <170541685620.1939555.13858739923708286644.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240115202821.995840-1-ross.burton@arm.com>
References: <20240115202821.995840-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Jan 2024 15:02:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5335


On Mon, 15 Jan 2024 20:28:21 +0000, ross.burton@arm.com wrote:
> Many Sphinx plugins now require Sphinx 5+ ([1], [2], and more), so
> sphinx 4.5 isn't usable as the requirements in sphinx itself are not
> pinned so you end up with a broken setup with errors such as:
> 
> sphinx.errors.VersionRequirementError: The sphinxcontrib.serializinghtml
> extension used by this project needs at least Sphinx v5.0; it therefore
> cannot be built with this version.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/documentation: upgrade Sphinx slightly
      commit: 83df70e181795ef36ce2605f11b4452960517574

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

