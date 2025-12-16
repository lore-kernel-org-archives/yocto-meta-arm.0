Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4945FD609D2
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:48:47 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27695.1765903720193482345
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 08:48:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=u9Ocur2T;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b2d7c38352so499153885a.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 08:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1765903719; x=1766508519; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5TnxLb04pmQsLk0AFz3uGGlZWIe4Pynfinjzyppmt8=;
        b=u9Ocur2TuYWECDv+E057xbAxuHrkb76y/iLmJzbBFOJGs22OtplzPvOAs8YdF8KW+M
         v15jvFOHPGLcYJMIe8MNWchW59EGEb8RSKs2qjJ43HZCDnYAGPe6Ui7GOjfNhBaHEtdD
         0W42ssU+Xof4uZ8ZnE6shHL91nQW0MKm8JUezGkgcNqgAIOfqFWMn7VnojScdGIBWWbM
         VDJrjnE3yRBU57/opRXCsNnVz09Wlsbo+YWrJ+wpfA1v3yhr7ox/OUL4rdEnbUITv3Bx
         zuwacSa/6WUl7dj0sgZcSDkecGJ5ei8q+DvK5C/U289JLsEHwPHx7ZLtH8VcktyQV8oE
         TZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765903719; x=1766508519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5TnxLb04pmQsLk0AFz3uGGlZWIe4Pynfinjzyppmt8=;
        b=wu0L+R9ndpZEHO4XFDfT3H7cY2X5D+cR7krlsa2hxDk8VCZMAkWaRV/xkyRcqJHrPR
         G/JB58El8Wk/jWl3plyjXZeXm/OSL8it/xN8zdSdZoHEnNGk62ma0simNNq6FtBK77oJ
         CjTWjlyUXmw/NJSOEmVAXkrDfm2bckQLK+HhHkKBJHCRtTMbmGFQRcgNBsLgY+FJAQfs
         i0jO7w40nW6Dne7Dd06dZwMjLHf/VzYZvB5VwY11EPz2nDsyXumaplIDPzOT7Ig1vNpc
         pCUplGkzYayEQsx6wTxHEjeYnzZjAx8rPTDZxArgmEgy2Ef25aIObe/cdd5qwyhZXm6Z
         NPjA==
X-Gm-Message-State: AOJu0YzuErid8hivjj3wk9OUvdb8orFv5B4WGoSuR7bxSGy5TbhCEmyN
	XUZGTxcCndxyG/6Taw3LkLiCMivD4z4nEh79uSQFqyo3VXgKU/m5AMIp16j4aPjQk1N+0c2mGVr
	6zUk=
X-Gm-Gg: AY/fxX6sE4nf4e8UaetjNiDuZI9q1IlG7EXM/HGArfVNhRpBP3fTC3LMfPst7nQ8A1x
	8+x/R2Hc5Pkq1jkQsUDhzgbur6VLFrLQxeYeHll0b93RTMlu+UTJwiPBbKMG9h39FnCDrYH9l3Z
	M1NQ4VspcRYOnK1J+9wDpgy1CfdeOZEX0nLg32I9j9ICTrrWPoXqOqbAlTVnbKf+ejw8I5jApKN
	ibtVqzyN8Q5C1nlBDH8wbmQ2W4AzApILbyiWR2/MgBzz4/Db3AlcLLuE3fIeKt2dVySXc3Drpyg
	aK/TE3QzUjAI30D6R6ZNG7DrytmtVJWZczup7r9FLen0dCOt0AitM/RGeof55paoCbbyellzOAl
	X5wSyzbs780o2cObN+WU+g4wG7OYlzggaknCA5ouTOKmpYEegqgcw7+xLyc7g+3R/HTCCfr+kBm
	6v/A==
X-Google-Smtp-Source: AGHT+IFSCM8XJC+3k+JSlkS5Xibcq+XTVP1zKitbE/aruMKeHlWb6pOctGKo76sdosBiNzt+9RAsGA==
X-Received: by 2002:a05:620a:29cb:b0:8a6:1a5d:7ae8 with SMTP id af79cd13be357-8bb3a100957mr2243057385a.28.1765903718949;
        Tue, 16 Dec 2025 08:48:38 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be30d96f69sm219790585a.22.2025.12.16.08.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 08:48:38 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/trusted-firmware-m: update 2.1.x to latest hotfix release
Date: Tue, 16 Dec 2025 11:48:31 -0500
Message-Id: <176590371090.587599.15974734198297010056.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251215142800.93984-1-jon.mason@arm.com>
References: <20251215142800.93984-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:48:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6806


On Mon, 15 Dec 2025 09:27:59 -0500, Jon Mason wrote:
> 


Applied, thanks!

[1/2] arm/trusted-firmware-m: update 2.1.x to latest hotfix release
      commit: 6680b3b376a1a5a680fc4c44ea2c503af9ee2fe4
[2/2] arm/trusted-firmware-m: update 2.2.x to latest hotfix release
      commit: fd4fa45a084db3c2a0f63c29db61b4ed0164d7de

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

