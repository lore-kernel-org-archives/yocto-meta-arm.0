Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B809E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 15:44:12 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.39882.1733499848548315087
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 07:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=SwdkKnHP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so18795296d6.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 06 Dec 2024 07:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1733499847; x=1734104647; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiQiADIhjC1v/OIPGSy3zbtxIY/DLi5vENitwXksQUg=;
        b=SwdkKnHPmjGbTP76FGOOsT8Qi5PItYM9027Pw3fnWLjssPchOuZNfypVSAxXlY02Mv
         JXJCcxG1He/VfDl2BPJCiEiWmw2ZnEDCTiBCB7gRu3smXO3isINQEvO5hWHC+dA8ZaEt
         1Wb3uqoFn9bCqk3h80DwKRMUhnlOGkRWb6GSnJTvYHHT+2q058iU4ASTibSa6Fd1bfkx
         8XLLKX6sbA+Isx3m7oyZttID4vin+jNZM54ZmQOM79sPOxPElox+uL1sXzJoE6bd3etx
         mmME6EFleW+3AKWsj93PImpUX7gwe3U3j4MpL94fm0K8Mh6w4xQfu1TLyajPzzek9iMT
         9/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733499847; x=1734104647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiQiADIhjC1v/OIPGSy3zbtxIY/DLi5vENitwXksQUg=;
        b=HNFy4ckDyB6WwIXuDfHFvy7ADXWAduyx3rw8LECOHyJpUwTmNsK7FRtGRPFK6sWKKQ
         2AAYwfbWwwrt6fpXzDVvSa5OASVNEdnbl3aI638ta9yBGHs1e8/xVUqtc6Z21Meokvjy
         209Z6DH6juZqLpvwJ8ZFStgHD7zNpqgl7+4fG3jZcgAT54z4IQdxKxOa45WsBxcV8YBR
         LHb7e6pGUOn+iXSPu0UXI6UwOmSkw2pdl7QVYcc12hV2XCeHkxe557Rn1IAh0bxq6rtR
         8m4Hj7y+/Rgt00aMddP54ocB+/wpqcpY0wk2NmHMJlN0bhxQBk6RJtS7Rkqf/B69hfpe
         SD7Q==
X-Gm-Message-State: AOJu0Yw0vYnTEuAfJcmnG8wczHdSr05IWncyDRLrY/raDRzpOUkgzLp5
	1zCTwO668sLjRBZo3xV1hGBy7bzbiC+ooD9WILc2Go278EB4XOwSPYwrJ71WaC+PtErSgLGmyek
	=
X-Gm-Gg: ASbGncuCZSL55xv0pJ0+0cg8lX2ei9H+ec7DvEZfrUMjOZSN92EPf+vsD+m47sdsn0s
	J0LNn6VGFMDIGkt4aBnHD1QvWcxM9VopjzfUHNs4i/0brG4g6hO1NWujsyZtv03qoRjmHfR6CD4
	6sGJjgOzncOHzleR3ac49TDN6EyvEnJBIUgStCF1Q2jdtQMak5EUevGrZQXLbJg4dJq6vQvuMBH
	5rUzq4kYc+TYBXEgsVPnWiN31DS5aGeG7isgYD8VA==
X-Google-Smtp-Source: AGHT+IHphSsz1ftw1pl75U3iIpGD2Loe8gE897ud021ubDYujKG5fexCvyf1yOCxrqtth+opEoCtJg==
X-Received: by 2002:a05:6214:21ea:b0:6d4:19a0:202 with SMTP id 6a1803df08f44-6d8e71e091emr38408066d6.33.1733499847428;
        Fri, 06 Dec 2024 07:44:07 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da695c98sm20307956d6.33.2024.12.06.07.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 07:44:07 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH styhead 0/3] arm-bsp: corstone1000: `CORSTONE1000-2024.11` release
Date: Fri,  6 Dec 2024 10:35:40 -0500
Message-Id: <173349934368.2735333.14735461411276303673.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205155948.787069-1-hugues.kambampiana@arm.com>
References: <20241205155948.787069-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 06 Dec 2024 15:44:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6277


On Thu, 05 Dec 2024 15:59:45 +0000, Hugues KAMBA MPIANA wrote:
> This patchset backports two commits related to the `CORSTONE1000-2024.11` pre-release.
> 
> It also adds one commit to pin the required SHA for the dependencies.
> 
> To-Do after merge:
> * Create `CORSTONE1000-2024.11` tag in meta-arm on `styhead` branch.
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/documentation: corstone1000: Amend documentation for CORSTONE1000-2024.11 release
      commit: 5c40c5f7f740a59b669c74da898a3687d53e2d6e
[2/3] kas: corstone-1000: Update the SHA of the Yocto layer dependencies for the CORSTONE1000-2024.11 release.
      commit: 8af2f218d45387851fe870dada856a85d5b98438
[3/3] kas: corstone-1000: Pin Yocto layer dependencies for CORSTONE1000-2024.11 release
      (no commit info)

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

