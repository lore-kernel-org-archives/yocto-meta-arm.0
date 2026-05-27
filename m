Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445AECD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 13:58:48 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21096.1779890319713363607
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 May 2026 06:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=MR7VIVXM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-914ad42e617so664933285a.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 27 May 2026 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1779890319; x=1780495119; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xB33O7PHBrL2EmaHaogvCg9qilzREQspx4+VYWcpjOs=;
        b=MR7VIVXMER96K7/QMAZmh+JgGJzQb/9PwIptlE6Yj6IX/nrZ8pelve0WR3m+XNdB9A
         1y6MigGbnWh/8vDW9en6kkW580eZ8Ls/Nw4hBdP0WGTgC417n1ffTWCJ2XwdkKkJDuhf
         IMi8d6OFuarjho6s+l4TNirDBF62ulO4DEOZ553uVSjfQ96MT+KN7FiEU4VNRUMlaDI+
         ln9miXQ5RZkdSHc0hlAuhIl6szZ7C/rv2ZpdnJSN+Fy/S+aotSdPp+yUu6MkYU4VY98E
         vNF/uqr1w/wAMHNE+sUvL7M2CHy8gfl+tAEHjDf2rsf5GRz1iYE+UlTxcvbMrifOGA5v
         Ht0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890319; x=1780495119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xB33O7PHBrL2EmaHaogvCg9qilzREQspx4+VYWcpjOs=;
        b=aYkml7Bh6tO5qY7tRy7rNFxU90V6/Hk30XkyRY/XDPQOLKrZngMUM3c7qI+f0gSjE1
         mKXqWwtL5QOmue7mrjqmDQgzS8gH3a9jDQHT+ZIzqmY+TFgMUMeJFdMNlvybadjNnuW3
         Gh/DsLJLHcdHb3N/QCa9z+Bd6YzOQmqFid5k2LxTvQZ4DWpeB+Oyff72J+9NLv7CEqur
         g88vIyuN+v1Abn2Re5MHqR1IkxlGYB44XgEhGb9RD3nzvz6v93VS8AcabSV3QoNkGp+h
         FuLUEL6MU0j82lRwy6bKhWXCgmSvQIPjhoZjMkrafho4mQ4qOzJowY9IXc1AadKFRReF
         S5Zw==
X-Gm-Message-State: AOJu0YwW/ZbtzsRqzzmFhwB2iDeLUESJcWTEcARUbxDsF7/nQENQ9I5H
	Fb3mc/eNDXgxUE6SmC+1aISr4ZR6axEqKTsQHU0zTxpvUOIP8+eqMz/+0HjM4IJKqHL5eJ3SB0T
	yP7A=
X-Gm-Gg: Acq92OESWByRjSNCUJNLJEsvNG2/0ak7okuvSbEesn5ZoZC5xUdn0oIk/wGL2463hbi
	egtWHvWYLl9gcN8cYJfs/u6kelZuB+K3RpzcFthyRfKbApEDEwAH+xbdK1po9xMMQHaWcPCSsYu
	Tr2GxlfrQjnj0MxlTU7pLoc7YW0/RkegUBdIdGA2B02WH1WqStsnikXYX7+1gHh46SaXIECWqre
	ZF1+rePwaboBIqsDE0lANcgIIHmzm3xOWxWAo17XZvqmkpehsS2UE1nvP71XtkH/xzxOCWK1SXy
	DRX2I0M8QeU91ReYF7IeE49wbNLu4W0RgWnyRbHdOeZv1pKly7ZgMygJtX1cxOwgNtZ8964Yln6
	Ze5gh3hGIZVmzIvwxshTAprUOEuNn/PuttxFI0kxBaGL04SMhKypJPJuwu/exSf7Np/xExNGRaT
	NtDBEwgv7nk/2J
X-Received: by 2002:a05:620a:1a1b:b0:914:aa0d:aa8c with SMTP id af79cd13be357-914b497b1f2mr3393819385a.42.1779890318607;
        Wed, 27 May 2026 06:58:38 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87f4b93sm474295385a.33.2026.05.27.06.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:58:37 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Alex Chapman <alex.chapman@arm.com>
Subject: Re: [PATCH] arm/edk2-basetools-native: Add missing libuuid dependency
Date: Wed, 27 May 2026 09:58:24 -0400
Message-Id: <177989030565.2023861.3732649732551385036.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520134354.554617-1-alex.chapman@arm.com>
References: <20260520134354.554617-1-alex.chapman@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 May 2026 13:58:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7064


On Wed, 20 May 2026 14:43:54 +0100, Alex Chapman wrote:
> GenFv requires libuuid in the native sysroot.
> 
> Add util-linux-libuuid-native and pass required flags through to the
> BaseTools makefiles. This can be missed on machines with libuuid
> headers installed, as the build may find the host copy instead.
> 
> 
> [...]

Applied, thanks!

[1/1] arm/edk2-basetools-native: Add missing libuuid dependency
      commit: ce5b4c4b0a78f62cbd76e45ebd9307c5cb99477a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

