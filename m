Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBE0C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 12:27:39 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.14346.1738240050451919608
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jan 2025 04:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=fTfdKQRQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e1a36b3684so9736786d6.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Jan 2025 04:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1738240049; x=1738844849; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZDFRYx58SggpMDgJhGphTlXkppM5+9039FDC/Ag3Uw=;
        b=fTfdKQRQKhBThsYCfwkwrQ0l+nqvHJ8KiCrsqIsz+28Yz1ZypzV4SjFWmKBEBEuAf7
         TebRMFLuituCYl9UD4snmt9vkU2nczhLuxx7gCb9VBvj3mcuZLc1sWgC5YRXaWoeir2l
         fC38hwIaOibmgM28sdBfrQtqBUNwneENBUwN6CPrO9ncURrQi39c+XbryPxf4pm6Rb73
         71qRILbm/VIsvH/ylbQbwS/5dtOyl6P+78mqyasHwCSV2ADrxfQEXRo3vdVTwPZIuqCT
         6ZFgA9csLIVJqx0D83GKlAD0vbobSY8NqXt68J/amog9RjSWdmeRz2YSsV/FyItNWxkn
         3qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738240049; x=1738844849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZDFRYx58SggpMDgJhGphTlXkppM5+9039FDC/Ag3Uw=;
        b=dyGfgRFZm+2H4hOGuY4vdi/t9Nm2ev0R5bs/DOfjpTbqPBBjhcVAVBRGwuQ/9Ndqq1
         xMhvAE/PWsTJ1gkW2E6LWT/M7PA8IVzt/C0w2/Jog2Pzd05o45Rs/Z8jxQ1QviV5JUCh
         xRmNy/M7WlCcJBWSgBlYOMA5w3AYPSDFwftI/rbnasoV/+Cm32FySUv5eQLez/pDoTu7
         U4XqM2dXtNYaxP3HTIT81H30/Qgy76HLw8vRCOGdw7j9rMtWkdjSHwb8uw2qlCZ74+J6
         BFTA6lr1hCuA7bVqPTnjRdquH7F0sFOmot8nZ4FOkhQwH88AayW/Z/DoixlNvCWvdRrc
         R4lw==
X-Gm-Message-State: AOJu0YwPvh5eNdd4T0GS8uZexzb50YmK6exsU0Ua5j9pKW+DbfYGfs7h
	ytt9S534EJRYTpY/madY3bvz2WfWrBLVTkRrpCizMyiYVWrbXTkuKAFr/3lKB7OgLdadP2XyiaU
	vyg==
X-Gm-Gg: ASbGncsAH+O01QTx7ANFZCKl8bJSsACwowjzayPOqcSHpcJW5LR6K3Zd6IJVXuDHYrK
	VRJ1tvJEp+Y32uOWeYWFRk4xqg1l3FzOZYAjwnlQvL9D6iFHM5BdTiDFr0YmgD7nop7x/VG9TRH
	m9CUETLH5gDblV6ZDZydkC5eMpyJO3V/eDrlbhFAX83LKevi4VyAbIPHUrYEMOCVP21607mUG17
	V6AsiCZyUrRwvrVZxzLhXx7kfGNEL2fgd+yuO5ZFZzEQqtRzxIWX/B4cDBpJnpu30orGqUiRp62
	bO/Vgeo=
X-Google-Smtp-Source: AGHT+IF5AowHlObcRUN/B3vtCXsvN49amVOJf/nn+1QbNRNz+fDQHXhFuQEc2EdF4/8vkxjm4Dpnhg==
X-Received: by 2002:a05:6214:4b82:b0:6e2:43d1:5feb with SMTP id 6a1803df08f44-6e243d161e4mr100563086d6.31.1738240049227;
        Thu, 30 Jan 2025 04:27:29 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2549223bbsm5627656d6.73.2025.01.30.04.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 04:27:28 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm-toolchain/external-arm-toolchain: update for toolchain provider changes
Date: Thu, 30 Jan 2025 07:27:24 -0500
Message-Id: <173824004442.2202481.1834553526615483272.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250128115500.3921264-1-ross.burton@arm.com>
References: <20250128115500.3921264-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Jan 2025 12:27:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6359


On Tue, 28 Jan 2025 11:54:59 +0000, Ross Burton wrote:
> The oe-core commit "classes/recipes: Switch virtual/XXX-gcc to
> virtual/cross-cc (and c++/binutils)"[1] changes the virtual names that
> the toolchain components use, so external-arm-toolchain needs updating
> to use these new names.
> 
> [1] 4ccc3bc8266c327bcc18c9a3faf7536210dfb9f0
> 
> [...]

Applied, thanks!

[1/2] arm-toolchain/external-arm-toolchain: update for toolchain provider changes
      commit: 78f7c988e235717308aa8b77cd332e65f1257efb
[2/2] arm-toolchain: remove external-arm-toolchain
      commit: 03af0c72f13a5455086afc9fa5ed92fa47f29101

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

