Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD2ECA0ECA
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 03:59:12 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.17830.1694491150892044787
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 20:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=gsabIsB/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-64c1d487e72so32989226d6.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 Sep 2023 20:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1694491149; x=1695095949; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WebKNzg2ckxPyZayCht7/vtQraHJ1b66/wioa8UyH5A=;
        b=gsabIsB/P2FZEIU+h3x0JHmkqzdgQMC1f9UrNartTI8gSjFdTtV0AulFx5JBG2Qvr3
         wkziJHAgqMy6WG4jXeQpEuqL+zg3W0GrCCVLQA0RJze2u+nj/oe1VsDOnAIsQQ1x8ZyL
         2IaYSO/FhLm57SvVcLZKIPHj5FIrHbIf1gTVW3UU6ssL+zQWrhbpjhp7QYUYE+ELoli/
         /JdLa1JtNGLv10swug7q2vf7g+/QBjsvfzncqup0ACAY95kHv2upr8rydm4WMhpOIgBC
         C5DVO1tp+F1opkeY7eASP4xn3voeKPiGW7NejTKzs3lnyPhES3D4l2TjW1eCQixmSw6D
         +I0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694491149; x=1695095949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WebKNzg2ckxPyZayCht7/vtQraHJ1b66/wioa8UyH5A=;
        b=fjTqcZ0jfIQ1NgO/lD/HZf9Wh4rqbxZyilKab7F7J7OGaKQPwEpNfvh+IRVK25H7Kq
         8KoT+kHSDY2p2ZdoUeUdLefz/Szr4W5Um5XoFC3bqZr4SrNUHgaSG54dHmxvlF9PHigb
         qxjA47NLVEGY8k6oIlV7GG+BpgQGzKqj6g87NomD97fO9PjDMET/FEth8+RvyIUXTVaS
         Kjnayi01N6fBwPK81AfsJOuKCO0d531ZOhAdgBK1yq8mQpxe3h00bJDZVfePHyojjA0Q
         TUVJF4ccDetJkQhFy0XuHXJG2q4baiLpYC+eR2q2Fwh9hnDdR3BYep43SMy1eLeKfLZW
         SHJg==
X-Gm-Message-State: AOJu0Yy4bgR1JXl7HySByT8wO4/B8zQsXgPJL4GVS7M9olhAZ5CK+rj3
	UBAVu5sQzw6YLyUOkH28vnnCQYhfkROJa8wFczQ=
X-Google-Smtp-Source: AGHT+IHteSl2zeS5Gb0U8ndGK9OUm65hG8affQ3fvyrCWW5WMItsmIj7z3Ok6dz7qw//NXxeQHpvIg==
X-Received: by 2002:a0c:e447:0:b0:655:efef:1277 with SMTP id d7-20020a0ce447000000b00655efef1277mr4039126qvm.30.1694491149147;
        Mon, 11 Sep 2023 20:59:09 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id b4-20020a0cb3c4000000b00655935bca82sm3439749qvf.134.2023.09.11.20.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 20:59:08 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] arm/generic-arm64: move SERIAL_CONSOLES to generic-arm64
Date: Mon, 11 Sep 2023 23:56:38 -0400
Message-Id: <169449099947.3039896.5462777015233148478.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230911134545.426509-1-ross.burton@arm.com>
References: <20230911134545.426509-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Sep 2023 03:59:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5037


On Mon, 11 Sep 2023 14:45:43 +0100, ross.burton@arm.com wrote:
> The consoles to use isn't specific to the qemu machine, and without a
> value results in no serial consoles when running on real hardware under
> sysvinit.
> 
> 

Applied, thanks!

[1/3] arm/generic-arm64: move SERIAL_CONSOLES to generic-arm64
      commit: b42bdbb7d6d1a34cff1e4ecde7bbccbb91867919
[2/3] arm/qemu-generic-arm64: force off KVM in qemu
      commit: 333719ea3efb0c24443b3408e651f4d236182ef6
[3/3] arm/generic-arm64: set XSERVER to install the modesetting driver
      commit: 3748fc07d2930723d4eb5adf4f3dc924b95392dd

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

