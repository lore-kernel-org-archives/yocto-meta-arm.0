Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4C5CCD1A7
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 06:52:42 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.5348.1761029556062958332
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 23:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=gtov6fuy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8909f01bd00so595522485a.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 23:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1761029555; x=1761634355; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMa7jAOO0b07fM4V1v6X37mwNrotrBZqccVrrcbVcII=;
        b=gtov6fuyhiAzu5EwoYM/vo8Y/prjY2y+0vXAwXD+3muX7A0yGuSFiLZGrzDpY4M+H+
         rCMz8iGtlnfsUFgVy+oEXxJtoviX0hK+8GR1aNxur7BtQ9vMV23zJZ+LOZpbTdzxXwYy
         V7vV2EYL2KFDW1v22KO2P4SRR+S9/OlfN5Mk71A+C+SDVScXrvR7LknUXvXSJByBAayw
         +p4yywp11pCs5FvfHeeS+sizuIfKH/v5k6+w3FO3MoV1bFOh951bSkWLpo1kLxRH0WEF
         n2gq9i0srLFkLRgw1fUk6ZX184Gvo4ab3piQwkA4Q7XLMTlJERQcOGpougxplUEv9V6F
         AwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761029555; x=1761634355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMa7jAOO0b07fM4V1v6X37mwNrotrBZqccVrrcbVcII=;
        b=r9YDU3Jpi5UFvZzzF6pScqcHxESFYG4zKTXGdMZJ1q10FpCKkKH4Ob4RNAkx0gUwhh
         LqxttPaGKT8Amr8TI19Ew1xl3dtfD0XSRRPmjumfI4ukp4LfeZIYks8zcBpmJfuUdY0K
         SbWt8EUNB44dMbXwNhOHzK22hFzrhJxHYZDRkfNR0ONtdHw4LcmxS8igXHZinuWPToPl
         2iISyF4RbnfvT9JfSIXB+6gHW8egV/2rIWdn/MkV5CtLPy/TYkJHXqJvmNCxdXO3iL1G
         +odHqSaI7eJr9vgaPEX9HuAidsCq67F6vH0kpcXi/i23SVVefzu0A1vcqs4NM/x5b/8I
         OGYA==
X-Gm-Message-State: AOJu0YxYvAHlpgksvJD0rpb5dZZ8Oo41z4UQRjVjzuhs6QQG8NMpaGl7
	VDzEnghN/ZXG83jZryme5j+wkct/rvCxfEx/bKd+d5RduyUfdBlWbClzb4OKyplKfd+6cnfbV5X
	ER8+TJA==
X-Gm-Gg: ASbGnct74AUNYyPZ4xW87grA4jBnwcUNTapwzWfI/Baonl7fFCZBYX5LK35hfIcXGh3
	z9L/B6wTlBZM9RHpF0MsmNB3dmIZ3Il0n51lgZvxvrYnF7vCnSGtpmeJOpPHkt64/LXW6mr2eJh
	V/tVEvXkas4CHSZRZi72pVwn6nGVUXdeN6r7r30UxCRGb20IAGb4NlnIO8927lEbD2ByFZ7zKRu
	FC04FKjZYg6020v+BGGPnYZ3+86QJzpUilVPm3y5WEV59ctIddqzjMwpVzNUy7gVaIZznwru0I6
	LJP7f1N0FNJjGZkHGIcmTWQqGGiNIQ0lrGc2ErscZ/taAKdpPUJOoNRiDZXGGfixDEDduOVkeDd
	Rhme8mCGEvKDbSt3JVoYefQG3FYnqCYnFqBvAUqAx4L97T//1QiTSlmCDxSuw/XeoxNgkF3Kwie
	1j5a7GtYqxEATl
X-Google-Smtp-Source: AGHT+IFRzlvGXVO2gnAR7mZeMZsDsx2q8AOD99Jq564j3KOr4INvPrc3/+t+R1rjXUS2wTeB3JaYvA==
X-Received: by 2002:a05:620a:3189:b0:893:1fde:10f3 with SMTP id af79cd13be357-8931fde124emr863407085a.90.1761029553971;
        Mon, 20 Oct 2025 23:52:33 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8aaf34386sm68951411cf.4.2025.10.20.23.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 23:52:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/5] CI: remove meta-clang
Date: Tue, 21 Oct 2025 02:52:24 -0400
Message-Id: <176102954392.2839567.4334432934516406397.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251020150924.84223-1-jon.mason@arm.com>
References: <20251020150924.84223-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Oct 2025 06:52:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6744


On Mon, 20 Oct 2025 16:09:20 +0100, Jon Mason wrote:
> Now that clang is in core, we don't need to use meta-clang anymore.
> Also, use PREFERRED_TOOLCHAIN_TARGET to specify the toolchain to use.
> 
> 

Applied, thanks!

[1/5] CI: remove meta-clang
      commit: 31455d75d1d91755bfc6481d18e8dc6b379d21c3
[2/5] arm/trusted-firmware-a: remove forcing of gcc for qemuarm-secureboot
      commit: 29bbc0bbf70e32b7f95a7755a4ede8d6ef28d4e7
[3/5] arm/optee-ftpm: enable clang compilation
      commit: b0325ba0f0874c79961c371f9df78e35a577a9a5
[4/5] arm/edk2-firmware: move the gcc toolchain force to the versioned recipe
      commit: 4d980ba25bceb1b872ae41d3399d1bc4dd2ace96
[5/5] arm/sgi575: force gcc for tf-a
      commit: 4300ff31a76c72833a5acb663fae5078dafdf005

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

