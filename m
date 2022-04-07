Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6B2C388F3
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:09 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.2161.1649355750916411619
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 11:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ThxnXTZO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id c4so8857647qtx.1
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 11:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IBicnXMrbpLjlyxQuT53rzgTGyndfiqSTpAr9gjJR4Q=;
        b=ThxnXTZOB985YRZYxRgD0mqmAAkUwIyVzq7k4v1HHyKapGCdcjklre+xzJpKF3Tj+b
         hwr9v2k08kEaMEHVJCdRDbczP30WM6xO/zajOOg8GXacisnH1mET4NNlYH0l/lzrGEbS
         bI3W4R40k5XHCPgv3gwaOhqGGwWMK2WGsZjY9pLQdp4Na8VZFnUA/nJVUuKs+bum5WzT
         ZbpUMx0wpK2+FV3WH3w0C1o8nI1OqM73R0Md0NFKBt9ZGefFvclClc0VnIlnYkxrzW89
         3+G2lddc0h5f5wmN8D4gXkRODDduBPGmkbjQAGEnIh+IaHV0WomzLMZeMGVj/jko7Njl
         6XyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IBicnXMrbpLjlyxQuT53rzgTGyndfiqSTpAr9gjJR4Q=;
        b=VcqCnNikNqIFmFlOxe3VMjKVn17fqVDN42w8QzUVBuz77jxYdTNTvNHGvDuYFpx9VQ
         CciPKN5L41eWiRGFtPQWDCcdd0WP6pjbnZOgSM4glsoMePQF6K2Jk0gycHKw0JhGhNWv
         nbQ6JoBdvUkH0B/x/ENEKJFOQZz7GxfAsPXs7ryUAMWds96mecqTyiMrLxLuXWmFBMh7
         qKQ/7D7Fp3IiJ2f2MJ53MyMHjWu+hSW1m8NcDvTXUZx1BaCuyhgWZmAxmTH3XZr/q4iB
         0VRCs/ueBe04921ctmDPON2YCI/dL6GMMEQjKL0gDgyLY1zB+Y50X5SHD6ZIG3SbroMX
         3vqw==
X-Gm-Message-State: AOAM531qEeaiSjMKpcfnRGn5lSDvrEzzDYQ+y+PqLCAW1wgBL7oC1X3/
	N+kgqydUBpIlMpJjcGON8qLY0nLxClbIow==
X-Google-Smtp-Source: 
 ABdhPJwfF2tOGgzT1TSPryb+Gt1OaoJBygKQejZs26m1ylH0nIh7FBEyDX+n+1CHMCq5QgszC3PiGg==
X-Received: by 2002:ac8:7dd1:0:b0:2e1:c708:12fa with SMTP id
 c17-20020ac87dd1000000b002e1c70812famr12625565qte.532.1649355749942;
        Thu, 07 Apr 2022 11:22:29 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 y7-20020a05620a0e0700b00699a30d6d10sm11284849qkm.111.2022.04.07.11.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 11:22:29 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm-toolchain/external-arm-toolchain: install to
 libexecdir not datadir
Date: Thu,  7 Apr 2022 14:22:16 -0400
Message-Id: <164935573606.148594.6306961201296329652.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220405134810.1999000-1-ross.burton@arm.com>
References: <20220405134810.1999000-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 20:36:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3263

On Tue, 5 Apr 2022 14:48:09 +0100, Ross Burton wrote:
> $datadir is for architecture-independent files, and a compiler is not
> that.
> 
> Install to $libexecdir, and clean up the installation commands whilst
> there.

Applied, thanks!

[1/2] arm-toolchain/external-arm-toolchain: install to libexecdir not datadir
      commit: a92e076973506a1a7b1a5308370322ccd8e734bc
[2/2] arm-toolchain/tcmode-external-arm: skip gcc-cross-*
      commit: faec9a7ad377e5b4a3e039e216dbb9c4093e45ed

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

