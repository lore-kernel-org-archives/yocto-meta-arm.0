Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C351FC001DE
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 01:35:03 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.79046.1691544898634371565
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 18:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=lhZXyUJC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-768054797f7so530785785a.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 08 Aug 2023 18:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1691544897; x=1692149697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7qmBHGmIPjKs6InEv3eFKD0Jkj9ZA4hzoSMt+yCZoo=;
        b=lhZXyUJCwqh9bKOd+nB7M4G+9vJbmaFk5SO5QokGRU9084vPeYRjxwS92qcjbLlhND
         WfktU6s4leGE8JpuN5+ZIr/DShs0XfVOTFOxvw7zdLYdSYSSOas39mpLwF3SQ5Vp4OhU
         OhpLdwc1+em6oybTFfYerf6hxqraEqn/ytThi/8oTmaxS/AGcA9A+VJh4ZXC4lRIH8aN
         X+M2bo8CVpzjrpIYAa+4BmJVZnw21Vfa3AXmBHR/k/2BEL3KETQ6fyWF+TU3/zpkcg7O
         x/fbESWMFeA4t5TVJYAZPANshUfPUZOdAGFWx0U89HaADUQjSEXlHPbGJYJ5XCvsHeD0
         h9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691544897; x=1692149697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7qmBHGmIPjKs6InEv3eFKD0Jkj9ZA4hzoSMt+yCZoo=;
        b=TIRefnXpt1Ee1gLdP/h1/CI9fMMJedbMrif+QIY0gAcEqZzZi1mRQ04+iF6eF6RKkJ
         q/efws5xTIXnIHgOsd9QCJrzHjpwGPBW8AEyaqV5L7YE4E2gLZzUUE2GTEt3zJYEhnTt
         sPTNdzfo8aSe0bI1wUHqPqMRFFW1IgVGHuRBDuoNW0uamXoCDEECQJ2VlLsPngm6wE0p
         IlvHHqN2W/q76Hus27PZB4IsB/Ydmhom/b0WjDIGBAGa/JIUFZPC36pah7U30Apq56xo
         6VtIu7bfGgzDbpKLZDh9O62PtSjJHLA2wJRgD6hFuxZVs8N1q4Js7UegyPpNqd96rqOo
         Oc7A==
X-Gm-Message-State: AOJu0YwU1yXiV2VMyJVy9Nr2oQGjNuPCDY9hY9ygnc6svk4Kbdc8IMFI
	cxTZ60NIxpW3XiVNjdL98CEbxcP5xhOTy1ME1mw=
X-Google-Smtp-Source: AGHT+IFXFUJUvtH6VClQvoBFMa5vg7HrX7aTFPoIH3hhBGF8U66VDQ4w9W7dJGVXkd2qx8AzsOGJMw==
X-Received: by 2002:a0c:dd13:0:b0:63c:fc23:be8b with SMTP id u19-20020a0cdd13000000b0063cfc23be8bmr1140978qvk.3.1691544897015;
        Tue, 08 Aug 2023 18:34:57 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id b28-20020a05620a119c00b0076825e43d98sm3673506qkk.125.2023.08.08.18.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 18:34:56 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v2 1/6] arm-toolchain/gcc-aarch64-none-elf: upgrade to 12.3.rel1
Date: Tue,  8 Aug 2023 21:33:43 -0400
Message-Id: <169154482387.1960847.10799164844485266730.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808173528.3606903-1-jon.mason@arm.com>
References: <20230808173528.3606903-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Aug 2023 01:35:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4948


On Tue, 08 Aug 2023 12:35:23 -0500, Jon Mason wrote:
> Upgrade the 12.2 recipe to 12.3.
> 
> 

Applied, thanks!

[1/6] arm-toolchain/gcc-aarch64-none-elf: upgrade to 12.3.rel1
      commit: 9fa8d0d0d013eb4dcc796e3e2acf82fbb641e0c8
[2/6] arm/edk2: move 202211 recipe to meta-arm-bsp
      commit: 299cb9e0b3ed9fc5add6645b365ba67b7f06e211
[3/6] arm-bsp: clean-up patch noise
      commit: ea797536dadeb0088a8fd57ecf934d776c3b231f
[4/6] arm/optee-test: update musl workaround patch
      commit: 07ec4baadf5a1c99d4c9945750f4a073d16fd675
[5/6] arm-bsp/tc1: remove trusted-firmware-m target
      commit: 8c42263eb3c7af5f498fc59689f908ac61249b9f
[6/6] arm/trusted-firmware-m: upgrade to v1.8.0
      commit: c92ac97d79a7eb9a00d6dd1b93473943493b3732

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

