Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F70C369CF
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 03:15:49 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.345.1745032542626755184
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Apr 2025 20:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=s3XxZxs0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so26340306d6.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 20:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1745032541; x=1745637341; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLt0FiLQUHIQSGBv0Gpjl6ineOhwTgkHk3sNipmfvEE=;
        b=s3XxZxs0ELSet2z5/LXEEFR7gXm+PE3NcCh2hiV739ftlfS46S5t8WHDAvTw47iIU2
         w51E1kkFng4AsVnX8u3y5hPFmrzylbz02pNhkPn7g4bzecxxY4X/dc66ELbSLQiR0nVs
         ghhIfZWwg1iwVPekc7s46tSBRXDNS/jSLRV7tk0iZShpTZEiI0XXmHTkwo+onwhhbANG
         SDRDpW9+vFsFnTVoQ83kKVgklJmUekTy7ezapbUQvRkKx0eMcQkpmHz0XCQ6+pHKGM40
         mnxhy2FWB+oo2xEtRO6lX5ewQzKEZdahbB78F32yKxOdcwdf8T8kjdI80XpJNwnCBMCY
         ZpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745032541; x=1745637341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLt0FiLQUHIQSGBv0Gpjl6ineOhwTgkHk3sNipmfvEE=;
        b=iFfkDrEMl4aUyXyAy2Gp+yxFMAyIzgfz8FwJScxGykXpT5Zu0TSdBp29ODJx5dLInk
         H92CPRIwjSkMx4jIYCXM6lK61VNX50v5FiZHm0fwI11G2KpefysEUCLCJsqFC701/wb6
         o4Lu5ayfQBUld8IqIJuV/u06sgxmZbM4sBTG/9gvXQnEwHQn73bw+O5iXg3CpbKLdqdb
         sYiH/RkH2tuBd8C7JjOaJU5yXBxcvx/OB1N6NxoRirJ24TjlFlzEoynZfTuxnbOJdInZ
         942pLrQRbnPmJvARThtl8JeyIV+iDde92dYBgCOt8hSnEjIZBoeu4Ok3/YPPGeSBvRW0
         8HWg==
X-Gm-Message-State: AOJu0Yxa3IKw0Ocx7bE2SpQJcavzrB1A3v6d6TqGzWKv3VoDsOVIIU7c
	Pc5jEqqxMLJ/L5RoapUKmzy4bTY585QahfPMoUR6wMlysdS9T6i4MIlHWOXwgxcksLPaAbucJ0n
	7SvXg
X-Gm-Gg: ASbGncuUpQsZCy0V1TTm+x58GOu5rVYev8Zx5HkwijQmrbMqkTrdhMgnXB5Z2COiPju
	c0j4QTYp1J0R2hWiTw33oH1yUVvlHWwAXUrmcYQT6Io2knsbjhdxG61y05V9U1ggcJ003U05Zyd
	junff1I/JVW2uy5g0+UumMJ7FeLFwyu0Mf86L/o8otv2Cd2SJwbRRRpXyhtGzN1HrZjS7LOMFxq
	xwunKF930ypeRJmkgUc2xGDMc3VQc9G2VIKNBtOelTJCsUxZoJ1tknhw0FRxJY/bj8eeCX1fTAE
	TiuGIyj61Nj+KdjcFxeWtaRDTynwkoj+
X-Google-Smtp-Source: AGHT+IE1MXdVOYGahrxYNs/UhsUvDNK5ZnLIs2NTdZII0LPogoHKSjc+E1nd4WClFG4LH8agXApAmw==
X-Received: by 2002:a05:6214:29cc:b0:6ec:f76f:64fa with SMTP id 6a1803df08f44-6f2c4683f29mr63898186d6.44.1745032541262;
        Fri, 18 Apr 2025 20:15:41 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b32741sm17312756d6.62.2025.04.18.20.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 20:15:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/scp-firmware: update to 2.16.0
Date: Fri, 18 Apr 2025 23:15:33 -0400
Message-Id: <174503253592.2569909.10856817937416256401.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250418131201.95204-1-jon.mason@arm.com>
References: <20250418131201.95204-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 19 Apr 2025 03:15:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6476


On Fri, 18 Apr 2025 09:12:00 -0400, Jon Mason wrote:
> Update SCP to the latest tagged version, and update the related patch to
> the new location of the relevant files.
> 
> For a comparison of the changes, please go to
> https://git.gitlab.arm.com/firmware/SCP-firmware/-/compare/v2.15.0...v2.16.0
> 
> 
> [...]

Applied, thanks!

[1/2] arm/scp-firmware: update to 2.16.0
      commit: a842ad2a126e11879c44f6cd639a8ecf80b14ced
[2/2] arm/python3-pydevicetree: update to 0.0.13
      commit: 7e85e2354dc4bbebe896f9d258f8a1b13a46c5ad

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

