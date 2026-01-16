Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65893D4A5FC
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 04:03:21 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.339.1768536198415205130
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 20:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=nkXDM2pl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c5389c3cd2so179692585a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 15 Jan 2026 20:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1768536197; x=1769140997; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPA56fTLpTBEgvQ7ZsuCd7JfAPoZaOVUzT+bGcNNMdk=;
        b=nkXDM2pl8crVdYkOEHbz/regnf4cJ0b/bvt5d8tMBqCOTrSjPDgP3ZqrRzNn7oj8Z7
         GMGEjzEqD1k+LF2aMoFrm3WnYLE2FJeEw1RDW/6Xgglp2N6DIMtqKua1C9FqUe/68fwK
         LeXk8VRL3sa1lby9qOzlesC9CdfGr3ALPmLj5YCeJR1KudAB/WPyTwxhUs1+wxBLViHC
         BjnvjpXkqc4dzI2jW9My9J+i6qTMHo3nvV+bCe6FFzcS/vQu5w4sHPN61SscfTHqIvwH
         o/TM/IGj6LXP0lpB8PaYJl5vdKqoOJMEphLbT5nIES/SFDYbyATO5X8//OPjHQH3DYKS
         04BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768536197; x=1769140997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nPA56fTLpTBEgvQ7ZsuCd7JfAPoZaOVUzT+bGcNNMdk=;
        b=HrQCXX3n4Z1CBASwQAzWJA2krS0mhzcJSkwLaBWsIbtsJFQhTDCO6JbpVbwKE7aHzM
         udO10Egng9B2qG1p5q+t9SxANAmVx/0FQ20qGjwDLt9teBIjReTbfuHaXQHH3M/VE4za
         J92pHYRpf2eYTEgx/fiuO2JLSbjMDRDzgwiL4UmaUz3EEMC5lylU5NUdkiCGs482rjfd
         pyPwHzK8LoNKthaBBCwsGaXFfu8JmNMnD6oAhXZwqbvHm7Mb0YHCqiEk4VDz33B6jMm7
         SGR+DL2DkuN+UUaicEJ+iC9XHI6Z4A9zUmR7ZlT8rUy1ERCdc1Pyr/iY6xW8DojPuv3e
         c04A==
X-Gm-Message-State: AOJu0YxxeSyGiLPvQAg0dtuq9qM5lqdzlhnmDZyVVK1J0Czd2oK7/50T
	b5v6uv3CyTVhlzkANZX+GHuBXmMfZ5OXXk9CBl/1RIjZ7p6fZpxNyfFcTVZLF2DLvfJCBF489q8
	ffLY=
X-Gm-Gg: AY/fxX4Q/hEguDLz7zu7EvhU7zmL30x81jPx7ChSVHH2KzE7Iwv/7CUFrHW9Y3q0gGv
	rhLHUKaSNRbK5M12kZ3Ajk3NtD6nDqTNFhGMd8DSHS2rGUCSZUdh8Gn5YLhYX1GmBgia7l8JReC
	EJWxM5Rv9pT42Ey1tzAqqVfHoJJHa7SPunjuvxPuxMTrQVYTr8A2wcLj6DqRMqsnZJUawnIVibi
	aqRPatziHPJVXt9Hxt1VXxWVM9EldBgLi/kS+x6Vulum3yj25J3JTDilGjE5BsP140YfzrlTk/A
	iIL+fPmkSlEiTJz1/0VFJuxFghzGTNPouxn27yt4Z01SLn/lONdkxZJg1lnKJmR2wcoD/dL21RL
	SBzG10mzSMIzdzyhUY/V6H6D8GvjvhFU6RKOmMopqpgRNnqruPGWYCk1gT4ispeaM4ysdp60oeq
	UT
X-Received: by 2002:a05:620a:290f:b0:8b2:db27:4261 with SMTP id af79cd13be357-8c6a67b3552mr252198885a.70.1768536197139;
        Thu, 15 Jan 2026 20:03:17 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72642fdsm124275185a.46.2026.01.15.20.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 20:03:16 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] Revert "CI: work around xen failures until fixed upstream"
Date: Thu, 15 Jan 2026 23:03:06 -0500
Message-Id: <176853618595.2093914.10025427917170445509.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260115210126.3358750-1-ross.burton@arm.com>
References: <20260115210126.3358750-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 Jan 2026 04:03:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6854


On Thu, 15 Jan 2026 21:01:25 +0000, Ross Burton wrote:
> The kernel upgrades are now in oe-core, so we can drop this workaround.
> 
> This reverts commit 341a0fd9762012622699aa1431b96a50a65bf16c.
> 
> 

Applied, thanks!

[1/1] Revert "CI: work around xen failures until fixed upstream"
      commit: f36c9add469582d6481472b34e70e2101071d3af

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

