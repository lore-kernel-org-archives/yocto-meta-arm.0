Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0B8C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 13:46:41 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.47419.1744033600583636524
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Apr 2025 06:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=gbfgoIKR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c5e39d1e0eso423076185a.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Apr 2025 06:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1744033599; x=1744638399; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNIaG/GgyNyzD+8GDWoBNBlYHSBfJAArLasEMzqT8Zk=;
        b=gbfgoIKRR+mY4uJ6qKQKargMDUQBTGJ04aR446QQLCeW4ht4TbodFIbtsNfUpREQFA
         IcgQncta6kcHqyhdJ5zdlSSEeIKeqfXHsskmJt8F8GS8/WWZRUM9WDgbTFFCOPrTrNo0
         KDkpICqmJxMPmVkbfdemve+/i79MZ2IXCvuPQ+WSBIqaNXRpPdOhO2CifBw9Q44jfPwM
         KPupARqNrUlVapeoQsPbR46eHzkDB0acPFjbvEvEYrCf13GOPOSdEMiW/4DpjNQwDfwh
         dKTkRrbt24H17EWlcuhSTIP4J3s5eKXluMywuiOPw26dqMENiEngj6Nie0dM37H8BECu
         D8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033599; x=1744638399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNIaG/GgyNyzD+8GDWoBNBlYHSBfJAArLasEMzqT8Zk=;
        b=tQ+U0WHmKthQFv6tiXKZdxd91FveVYZIhhzto5R0CtiAOktNd0spBY+jxp2O7FZVKH
         XQBfgmw17RQ5iABKQ3KNMl8PW9JAu+2EehENxmB47D4eVfmCBp3dhYDfgM1p16IPOJZ2
         hvHKXFppnK9PbOtw2rkvORxS6NsoMc6OAHYdGGrUi43dm11DunmCc51oOdV2azza8aLK
         aFduRR9+BVRnc68bEzeKApzU1QED7dNXWxfBZze80lE7wF2PM4T6PgMJvt76/uylriVJ
         UuAUH+/A/3wnaD4jF7+AKtMhCIRSAqw/z7hr2khB3di5akGVaZ+L/LOgklpWwyVSHio4
         z7oA==
X-Gm-Message-State: AOJu0Yxuiel0qcUPC+thN39UNMYNlnBbxOOFa7UhyRj9GWOCocSfagU4
	nllvKsgMNz32RLZpYHgLv8msEzJd8dmJddpP24OTq/7Bm+fVGg9A2mpzMTmm29/3Q05ZUNc6n8Q
	4UQ==
X-Gm-Gg: ASbGncu4Fdfn75fxke6HWfv4p0QiVFy83/slZ24+zrrIEvFGJkJb07Zii/SMVU+Y43G
	YT5CqI1baQi2mk1bygT/Jeyzl0oHwWhv/+FSEvvVetWKETLTZx8MNXE9SAUzb+fPG1n+86OWI3h
	RHkBun6HW9deMfpmmxYVuxBYnL6fsKOU0El2nMrAMGQkWXubdVyomTRtFnlOfXy2c9jMIjBXgZ3
	ddNDrSewjOkuFDtKFALBf6R/tYvagrtx44mzKoUNJNasOoRogoBiMBnvo4qE1auO2/9wjY9xeSb
	36UTNybX+G4Daxm9h3c0Udem7z88XLIbfhr1
X-Google-Smtp-Source: AGHT+IF2NsR4BtoOdVx7bncyz8ipmqxTqrgqSWBstnQ/nKAsgvaIEYwjTLRyHXiAKKAueyos+jaq4g==
X-Received: by 2002:a05:620a:4306:b0:7c5:99a6:a1ae with SMTP id af79cd13be357-7c774bf81b7mr1869414185a.0.1744033598489;
        Mon, 07 Apr 2025 06:46:38 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b121decsm59931621cf.62.2025.04.07.06.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:46:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm/execstack-native: add new recipe
Date: Mon,  7 Apr 2025 09:46:32 -0400
Message-Id: <174403359206.2954312.2284608041058859273.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404173445.3901440-1-ross.burton@arm.com>
References: <20250404173445.3901440-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Apr 2025 13:46:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6452


On Fri, 04 Apr 2025 18:34:44 +0100, Ross Burton wrote:
> Add a recipe for the execstack binary from prelink-cross. This tool is
> used to manipulate the GNU_STACK segment in ELF binaries, specifically
> to control whether the binary requests an executable stack or not.
> 
> 

Applied, thanks!

[1/2] arm/execstack-native: add new recipe
      commit: b19f24bd0ad6c153ea76f4a5b0a8e5fa0b916d72
[2/2] arm/fvp-base-a-aem: remove spurious executable stack from one library
      commit: 1d119f24f9eb4c65d944fbdb0ab2d737f3eaa001

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

