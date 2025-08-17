Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961A1CA0EE9
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 22:16:43 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.62102.1755468994813056542
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 17 Aug 2025 15:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=WAquR2Y3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7e870636870so360532685a.2
        for <meta-arm@lists.yoctoproject.org>; Sun, 17 Aug 2025 15:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1755468994; x=1756073794; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRFsV6JQd5wMuTXuheh4P7rdgnl3K2P8Lnm2RXmqpgI=;
        b=WAquR2Y39l6ApzEkMxLXoRcVRm5KidJEpZ3anKvdzTm6mEqTWUUS6M1hqvVaheNxHW
         Md8820ejSkW/PWvoC44Q/qToMVN0GUjCOn0IxYEPUhM+Kh8wU98Q8XAivGcwKaXm7NsE
         feo/O1xIJof7TJ2NvXQ1cNX0lNC/d9PMJs0ZkKnIM/xA6ZmS16d07N32NnbZHHWY9dBa
         F7C9HCd3+Y45PK2xaZNpwN2Oxw6HPjPOG/xv92RWhdhOWBBjS9F8dgefUoPZy84/5sEl
         YBytf4WmrBDfzNQsvBIGuxQcxeXSSWB8ssmJj/dmbtoiwdwAS54NcVINDi5/VelgZzNC
         Nvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755468994; x=1756073794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRFsV6JQd5wMuTXuheh4P7rdgnl3K2P8Lnm2RXmqpgI=;
        b=hd2ORO97lbFDYmnqHkIvAUnqIaSmWLRCqMwM9ovEC1+KBbTk7fVnKts+BP1SSWKiCU
         9s277Wgm4Q26Xtw33nEkYyQzfQLXWQQ44Q5XShP417YR3bOyY0NIswsKCRz6EZkpnb/C
         5deC8HnTsBfgVrEp4KL2qxguLwuZghJFvKVNvN2SspVR1vloMa3UPe8u6PjrGJQG315S
         YsgvHkPyZ9WpzTLN8t1Uf1AGIS8KVHO0QrCwKp38KNh75xEBJwTwJbqp4SLSvL8hzsQx
         axJ4MiDtfemM7A5Pk1kPbkuNAvYdNO0oMzZpeaFTwR1AO/D6SBJ0+Uwq80WFZBsqWCJ+
         FdNA==
X-Gm-Message-State: AOJu0YwU5autXVW7gQcXJfjwnqscegRqRdLSoMFxTJmOQ7sCn8JJwI8H
	fP24E+HrZtEnT6RClWPfBA/iPH6ToKaiX9WJbLpTUnW1ysYgWG/BS4wYto/4SQpuoj0BanvkvOw
	OyZQ=
X-Gm-Gg: ASbGncvxdU7J+dJCXcDXPOS+0b0tDXy5guSxpUjs2B7vEalmcNMZ8hPiUCJIePrOVEi
	ZMekEN/I9R99oBJhY+tEmwQx6DdnOQ16EgJs5SbJ85hUuQGVImQ1/eVb9QYVK8PhbIyck46KBzd
	YRn7curApI2gd3qyT6GYg+HUd9QWFqYio4An/DLsQ61j52J7EbmTJOS7+f/hPXPhli/uZd4AEyb
	vJz4a2fkz6N5F4cq6ghJrjFgcMDTLZpZ1STPHnunQo1/VE5negItwTjjMRHTWCCSNwRFuLA0YPP
	58N+TK+WalaMJLKXo/1kBMEbyQWT7KdY4JxryrJQpy7CT/+dEGeDZh01isN2e3sVjg+w84UBLA9
	vW//9Y31FK0sqqBbkAjVuB8tT
X-Google-Smtp-Source: AGHT+IEVKmB1+jo1LWStSeE6TmMY9HNVT098Z9QB2CXTEkOihs2kY2ixMbiONyL3GN2AWOuTraQW1Q==
X-Received: by 2002:a05:620a:400c:b0:7e7:fcf7:1f82 with SMTP id af79cd13be357-7e88681c42bmr759354785a.52.1755468993490;
        Sun, 17 Aug 2025 15:16:33 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e05477fsm493865485a.22.2025.08.17.15.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 15:16:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Michael Safwat <michael.safwat@arm.com>
Subject: Re: [PATCH 1/1] arm-bsp/trusted-firmware-m: corstone1000: Update the patches upstream status
Date: Sun, 17 Aug 2025 18:16:19 -0400
Message-Id: <175546898073.1250199.3502220299675650773.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250813082236.2202985-1-michael.safwat@arm.com>
References: <20250813082236.2202985-1-michael.safwat@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 17 Aug 2025 22:16:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6666


On Wed, 13 Aug 2025 09:22:36 +0100, Michael Safwat wrote:
> These patches upstream status changed to Backport:
> 0006-platform-CS1000-Add-multicore-support-for-FVP.patch
> 0009-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
> 0010-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
> 0012-Platform-CS1000-Remove-unused-BL1-files.patch
> 0013-Platform-CS1000-Fix-compiler-switch-in-BL1.patch
> 0017-Platform-CS1000-Enable-FWU-partition.patch
> 0018-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
> 0019-Platform-Corstone1000-Increase-buffer-sizes.patch
> 0023-Platform-CS1000-Remove-duplicate-configuration-parameters.patch
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-m: corstone1000: Update the patches upstream status
      commit: 8d38f576231557f545443cb9dcbedfacc78faa10

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

