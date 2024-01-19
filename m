Return-Path: <mlynch@hi-techniques.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC9EC4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 18:01:15 +0000 (UTC)
Subject: optee failing to build on head of dunfell branch for j7-evm
To: meta-arm@lists.yoctoproject.org
From: mlynch@hi-techniques.com
X-Originating-Location: Madison, Wisconsin, US (24.159.236.186)
X-Originating-Platform: Windows Chrome 94
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 19 Jan 2024 10:01:06 -0800
Message-ID: <UuhE.1705687266596590169.nYL6@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="rhltKoimvw00Z6swSp0a"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Jan 2024 18:01:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5348

--rhltKoimvw00Z6swSp0a
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

While trying to build core-image-minimal for j7-evm using the head of the"d=
unfell" branch of meta-arm, the build fails during compile of optee.=C2=A0 =
The optee recipe contains a patch that is supposed to patch "mk/gcc.mk" but=
 I found that, for whatever reason, the patch is NOT getting applied before=
 "make" gets run.=C2=A0 I worked around the issue by creating a bbappend fo=
r optee-os_git that fixes up the "mk/gcc.mk" file.=C2=A0 My bbappend simply=
 "prepends" do_compile such that what the patch file does is done to the "m=
k/gcc.mk" file.=C2=A0 What I can't figure out is why the patch from the lay=
er isn't getting applied in the first place but I do have a theory I was ho=
ping someone could verify/validate.=C2=A0 What I noticed is the SRCREV (023=
e33656e2c9557ce50ad63a98b2e2c9b51c118) in optee-os.bb does not match to any=
 commit reference in the remote git repo for optee_os and the version that =
ends being retrieved is the head of the "master" branch of optee_os.=C2=A0 =
I believe the mk/gcc.mk file that comes in with that version (master) of op=
tee_os does not match what the patch file is expecting and thus the patch f=
rom the dunfell branch fails to apply?=C2=A0 One question I have is why bit=
bake doesn't show a patch application failure but only shows a failure late=
r when the build fails?=C2=A0 Does any of this sound plausible to anyone or=
 am I way off base with this?=C2=A0 Are these questions maybe more appropri=
ately directed toward bitbake maybe?=C2=A0 Anyway, just looking for thought=
s/opinions since I have a work-around that appears to do what is needed.

Mike

--rhltKoimvw00Z6swSp0a
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

While trying to build core-image-minimal for j7-evm using the head of the"d=
unfell" branch of meta-arm, the build fails during compile of optee.&nbsp; =
The optee recipe contains a patch that is supposed to patch "mk/gcc.mk" but=
 I found that, for whatever reason, the patch is NOT getting applied before=
 "make" gets run.&nbsp; I worked around the issue by creating a bbappend fo=
r optee-os_git that fixes up the "mk/gcc.mk" file.&nbsp; My bbappend simply=
 "prepends" do_compile such that what the patch file does is done to the "m=
k/gcc.mk" file.&nbsp; What I can't figure out is why the patch from the lay=
er isn't getting applied in the first place but I do have a theory I was ho=
ping someone could verify/validate.&nbsp; What I noticed is the SRCREV (023=
e33656e2c9557ce50ad63a98b2e2c9b51c118) in optee-os.bb does not match to any=
 commit reference in the remote git repo for optee_os and the version that =
ends being retrieved is the head of the "master" branch of optee_os.&nbsp; =
I believe the mk/gcc.mk file that comes in with that version (master) of op=
tee_os does not match what the patch file is expecting and thus the patch f=
rom the dunfell branch fails to apply?&nbsp; One question I have is why bit=
bake doesn't show a patch application failure but only shows a failure late=
r when the build fails?&nbsp; Does any of this sound plausible to anyone or=
 am I way off base with this?&nbsp; Are these questions maybe more appropri=
ately directed toward bitbake maybe?&nbsp; Anyway, just looking for thought=
s/opinions since I have a work-around that appears to do what is needed.<br=
 /><br />Mike

--rhltKoimvw00Z6swSp0a--

