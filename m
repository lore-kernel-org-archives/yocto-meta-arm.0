Return-Path: <marek.bykowski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E8CC87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 17:06:54 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.30843.1754500008859868268
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 10:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g5fBAV6Y;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: marek.bykowski@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-7074710a90bso1676706d6.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 Aug 2025 10:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754500008; x=1755104808; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pj6dyz6mEqVYsGtGyAQLYNzRWeOKMTKSTJniWH7+OV8=;
        b=g5fBAV6YDSGZZJR24m9EEhoAS1WBomO/OPHzdC92RmAnKrG9hyVeZZLGinVvCBDL7f
         NvQYPCSSHtNpySRcuq9JG4CD9j0fX2JBgZ1ryx5j/GBeOUPSJccWQsFHdCHi0QPY6Wqu
         brfI0g6HRCQMjCzwdx01an8Z+DZS4p4NjYPYs7jRsQqLF3PyzYaRdmYCHTQzyKIeDA+W
         GMOuQRg9vv4CPgBXeM39Da805xjt6Tx5NazmKt1bsMkUvAL+OR1b1DPPgxMdrFqLa8ft
         PgMtuCXrsQyfLtcJIZD7XW0MNo3x/j1m/I+7Xp2iLrhGvfk268DiRem31CxP3yOs9s7k
         s/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754500008; x=1755104808;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pj6dyz6mEqVYsGtGyAQLYNzRWeOKMTKSTJniWH7+OV8=;
        b=KYjl2bPNbzRggfmsMl7jMPJ1aAXfwzOqpB/aZFnr4qvx5RoxUjCnVtzeb6lHN2j38A
         FcHRBAYuInY3G9xik34BTuosXgaCSe8oB+8GRJEZ7WNlk5Ad3ZuVcwwp/alsiO9wxR2l
         8brTFQp5p6L+r4+NwR8qbnH63DuzXA0rcJKPTKCZvnUWC6nDnBQlH7oADDHyna6tgr+o
         XaDAvqn7suMNzHSfMJ/JXD9o/QzX0E5C3Es/XuDWh2iESzFMbfUcj/k8JviC2OaYfaQN
         FwKJ8drnWaGLeot8k46MiW3rFNGrfQAN5+VFmw25FjOuYK1uVzojHwfdpbHcue4bScGJ
         BdZw==
X-Gm-Message-State: AOJu0YxVXTDbpCyV3jN3cXvHFrj3ZYTlAppvzLJwloU42JtxOfUEbA7b
	OBwysP9ukJj77JRtESrAh8dXNjffDKc785WcTumFntuib21kD8wg4IT/d6U6KlnGyatCNa4ZqBN
	sIgt8zS5MLJ6ssk6Sko3NZGu8El7wHjw1N5wLM7o16w==
X-Gm-Gg: ASbGncuVwZVDwAqL+S2BFjivLWJVMRX59QenS/bPA1a1QURCBD8csctjn87ZIVWYpdz
	vltHa3yixpY7T2odFBmTaZZgWKjhahrPQcOZ88meMkifQG14wwEnhHeCDAUUqBqarHBsDg1WpHs
	yZz3sG+BKc88nDekQUimnqDY+e2minBR8Mf88v+/U9C4Os7TKpiqlNfYPZVUV3zIVM2yG71XjZb
	xc2H0VklL7ZsNgzjw==
X-Google-Smtp-Source: AGHT+IGsIYz58osSlGoAmmh/BJUs4AIiafzkVvFpJ+OAIrU4W3naQlyOSg+laSpo9PhGRu6T0LCWksFS7w5DFWPQ64k=
X-Received: by 2002:a05:6214:765:b0:707:6a5e:646c with SMTP id
 6a1803df08f44-70979518f3dmr57458636d6.7.1754500007447; Wed, 06 Aug 2025
 10:06:47 -0700 (PDT)
MIME-Version: 1.0
From: Marek <marek.bykowski@gmail.com>
Date: Wed, 6 Aug 2025 19:06:35 +0200
X-Gm-Features: Ac12FXw1itYwgGHfdG88N9DnJOig3FZel21gW31B51hDNgW8634qp3tqGBvAmHQ
Message-ID: <CAHw2UgCX68jNvZotfKcoRh6V2n=1TK2tE4mdYE-SwMwj8oh9Fg@mail.gmail.com>
Subject: Does FVP_Base_RevC-2xAEMvA platform model support fully for address
 translation at PL2 stage 1 MMU in aarch32?
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Aug 2025 17:06:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6662

Have you ever succeeded in performing a Stage-1 MMU translation using
LPAE (Long Physical Address Extension) on the FVP_Base_RevC-2xAEMvA
platform model running in AArch32 Hyp mode (CONFIG64=0)?

I use for that the fvp-base-arm32 SW stack you dropped support in
meta-arm the other time ago.

I have tried it in u-boot running in pl2 (Hyp mode) without success.
Whichever attributes I assign to the region, Normal Memory with Inner
or Outer Cacheability, Write-Through, or Write-Back,  or Non-cacheable
I always end up with Strongly-Ordered.

I inspected the MMU code thoroughly there, compared with the other
codes for MMU, from trusted-firmware-a, xen, and Linux kernel and it
seems u-boot does it correct. Here is the brief execution steps it
goes through:
#1 Set up the 2M-block at the 2nd level table with attributes
- block descriptor: 0x8000044d
  - bits[1:0] = 0b01 -> valid descriptor, descriptor type: block
  - bits[4:2] = 0b011 ->  AttrIndx[2:0] points to MAIR0[3] . MAIR0[3] is 0xff
  - bits[5] = 0b0 - Non-secure
  - bits[7:6] = 0b01 - Access Permission: Read/write
  - bits[9:8] = 0b00 -> Shareability: non-shareable

#2 Set up 1st level table descriptor pointing to the descriptor shown
above. Its attributes are on bits[1:0] = 0b11 meaning it is valid and
its type is: table
#3 Set control registers as follows

HTCR is: 0x80000500 so
  - bits[9:8] = 0b01 -> Inner Cacheability to Normal memory, Outer
Write-Back Write-Allocate Cacheable
  - bits[11:10] = 0b01 -> Outer Cacheability to Normal memory, Outer
Write-Back Write-Allocate Cacheable
  - bits[13:12] = 0b00 -> Non-shareable
HTTBR is: -x00000000feff4000 -> points to 1st lavel table set in #2
HMAIR0 is: 0xffeeaa00 -> as shown above AttrIndx[2:0] points to MAIR0
and the four nibble being 0xff. 0xff is Normal memory, Inner
Write-Back Cacheablea, Non-transientb
HMAIR1 is: 0x00000000 - I set it to zero as not used.

#4 Then it sets the M and C bits in HSCTLR registers

And inspecting the page tables with amrds Strongly-Ordered
0x80000000 | L2 Block | NP:0x0000000080000000 | XN=0, PXN=0,
Contiguous=0, nG=0, AF=1, SH=0x0, AP=0x1, AttrIndx=0x3
H:0x80000000-0xFEFFFFFF | NP:0x80000000-0xFEFFFFFF | Strongly-ordered
| NA | False | True | True

Could it be that FVP_Base_RevC-2xAEMvA doesn't support the feature?

Thanks,
Marek

